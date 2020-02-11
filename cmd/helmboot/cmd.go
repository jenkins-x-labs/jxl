package helmboot

import (
	"github.com/jenkins-x/jx/pkg/cmd/helper"
	"github.com/jstrachan/helmboot/pkg/cmd"

	"github.com/spf13/cobra"
)

var Helmboot = &cobra.Command{

	Use:   "helmboot",
	Short: "This command triggers a Jenkinsfile in the current directory in a Jenkins server",
	Long:  `This command triggers the Jenkinsfile in the current directory in a Jenkins server installed via the Jenkins Operator`,
	Run: func(cmd *cobra.Command, args []string) {
		err := run(args)
		helper.CheckErr(err)
	},
}

// Run runs the command, if args are not nil they will be set on the command
func run(args []string) error {
	hb := cmd.HelmBoot()
	if args != nil {
		args = args[1:]
		hb.SetArgs(args)
	}
	return hb.Execute()
}