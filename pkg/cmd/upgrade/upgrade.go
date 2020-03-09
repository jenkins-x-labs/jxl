package upgrade

import (
	"github.com/jenkins-x/jx/pkg/cmd/helper"
	"github.com/jenkins-x/jx/pkg/cmd/opts"
	"github.com/jenkins-x/jx/pkg/cmd/templates"
	"github.com/spf13/cobra"
)

// UpgradeOptions are the flags for delete commands
type UpgradeOptions struct {
	Cmd  *cobra.Command
	Args []string
}

var (
	upgrade_long = templates.LongDesc(`
		Upgrade the whole Jenkins X platform.
`)

	upgrade_example = templates.Examples(`
		# upgrade the command line tools 
		jx upgrade cli

		# upgrade the platform 
		jx upgrade platform

		# upgrade extensions
		jx upgrade extensions 
	`)
)

// NewCmdUpgrade creates the command
func NewCmdUpgrade(commonOpts *opts.CommonOptions) *cobra.Command {
	options := &UpgradeOptions{}

	cmd := &cobra.Command{
		Use:     "upgrade [flags]",
		Short:   "Upgrades a resource",
		Long:    upgrade_long,
		Example: upgrade_example,
		Run: func(cmd *cobra.Command, args []string) {
			options.Cmd = cmd
			options.Args = args
			err := options.Run()
			helper.CheckErr(err)
		},
		SuggestFor: []string{"update"},
	}

	cmd.AddCommand(NewCmdUpgradeCLI(commonOpts))

	return cmd
}

// Run implements this command
func (o *UpgradeOptions) Run() error {
	return o.Cmd.Help()
}
