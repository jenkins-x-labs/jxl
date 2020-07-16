package edit

import (
	"fmt"
	"reflect"
	"strconv"

	jxedit "github.com/jenkins-x/jx/v2/pkg/cmd/edit"
	"github.com/jenkins-x/jx/v2/pkg/cmd/helper"

	"github.com/spf13/cobra"

	v1 "github.com/jenkins-x/jx-api/pkg/apis/jenkins.io/v1"
	"github.com/jenkins-x/jx/v2/pkg/cmd/opts"
	"github.com/jenkins-x/jx/v2/pkg/cmd/templates"
	"github.com/jenkins-x/jx-logging/pkg/log"
	"github.com/jenkins-x/jx/v2/pkg/util"
)

// Options contains the CLI options
type Options struct {
	*opts.CommonOptions
}

var (
	editLong = templates.LongDesc(`
		Edit a resource

`)

	editExample = templates.Examples(`
		# Lets edit the staging Environment
		jx edit env staging
	`)
)

// NewCmdEdit creates the edit command
func NewCmdEdit(commonOpts *opts.CommonOptions) *cobra.Command {
	options := &Options{
		commonOpts,
	}

	cmd := &cobra.Command{
		Use:     "edit [flags]",
		Short:   "Edit a resource",
		Long:    editLong,
		Example: editExample,
		Run: func(cmd *cobra.Command, args []string) {
			options.Cmd = cmd
			options.Args = args
			err := options.Run()
			helper.CheckErr(err)
		},
		SuggestFor: []string{"modify", "change"},
	}

	cmd.AddCommand(jxedit.NewCmdEditBuildpack(commonOpts))
	cmd.AddCommand(jxedit.NewCmdEditDeployKind(commonOpts))
	cmd.AddCommand(jxedit.NewCmdEditStorage(commonOpts))

	err := addTeamSettingsCommandsFromTags(cmd, options)
	helper.CheckErr(err)

	return cmd
}

// Run implements this command
func (o *Options) Run() error {
	return o.Cmd.Help()
}

func addTeamSettingsCommandsFromTags(baseCmd *cobra.Command, options *Options) error {
	teamSettings := &v1.TeamSettings{}
	value := reflect.ValueOf(teamSettings).Elem()
	t := value.Type()
	for i := 0; i < value.NumField(); i++ {
		field := value.Field(i)
		structField := t.Field(i)
		tag := structField.Tag
		command, ok := tag.Lookup("command")
		if !ok {
			continue
		}
		commandUsage, ok := tag.Lookup("commandUsage")
		if !ok {
			continue
		}

		cmd := &cobra.Command{
			Use:   command,
			Short: commandUsage,
			Run: func(cmd *cobra.Command, args []string) {
				var value interface{}
				var err error
				if len(args) > 0 {
					switch structField.Type.String() {
					case "string":
						value = args[0]
					case "bool":
						value, err = strconv.ParseBool(args[0])
						helper.CheckErr(err)
					}
				} else if !options.BatchMode {
					var err error
					switch structField.Type.String() {
					case "string":
						value, err = util.PickValue(commandUsage+":", field.String(), true, "", options.GetIOFileHandles())
					case "bool":
						value, err = util.Confirm(commandUsage+":", field.Bool(), "", options.GetIOFileHandles())
					}
					helper.CheckErr(err)
				} else {
					helper.Fatal(fmt.Sprintf("No value to set %s", command), 1)
				}

				callback := func(env *v1.Environment) error {
					teamSettings := &env.Spec.TeamSettings
					valueField := reflect.ValueOf(teamSettings).Elem().FieldByName(structField.Name)
					switch value.(type) {
					case string:
						valueField.SetString(value.(string))
					case bool:
						valueField.SetBool(value.(bool))
					}
					log.Logger().Infof("Setting the team %s to: %s", util.ColorInfo(command), util.ColorInfo(value))
					return nil
				}
				helper.CheckErr(options.ModifyDevEnvironment(callback))
			},
		}

		baseCmd.AddCommand(cmd)
	}
	return nil
}
