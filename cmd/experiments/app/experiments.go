package app

import (
	"github.com/jstrachan/helmboot/pkg/cmd"
)

// Run runs the command, if args are not nil they will be set on the command
func Run(args []string) error {
	cmd := cmd.HelmBoot()
	if args != nil {
		args = args[1:]
		cmd.SetArgs(args)
	}
	return cmd.Execute()
}
