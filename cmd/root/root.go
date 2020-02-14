package root

import (
	"fmt"
	"github.com/jstrachan/helmboot/pkg/cmd"
	"github.com/spf13/cobra"
	"os"
)

var (
	// Used for flags.
	cfgFile     string
	userLicense string

	rootCmd = &cobra.Command{
	Use:   "experiment",
	Aliases: []string{"exp"},
	Short: "Experimental commands for working with Jenkins X",
	Long: `These are experimental commands that are likely to change and could be removed

Commands can mature to alpha and beta phases before being accepted into the core jx command
Complete documentation is available at https://jenkins-x.io
`,
})

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	rootCmd.AddCommand(cmd.HelmBoot())
}