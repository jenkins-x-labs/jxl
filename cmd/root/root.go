package root

import (
	"fmt"
	"os"

	"github.com/jenkins-x-labs/jxl/cmd/root/step"
	"github.com/jenkins-x/jx/pkg/cmd/clients"
	"github.com/jenkins-x/jx/pkg/cmd/opts"
	"github.com/jenkins-x/jx/pkg/helm"

	"github.com/jenkins-x-labs/helmboot/pkg/cmd"
	"github.com/jenkins-x-labs/helmboot/pkg/common"
	"github.com/jenkins-x-labs/jwizard/pkg/cmd/create"
	goreleaser "github.com/jenkins-x-labs/step-go-releaser/pkg"
	tp "github.com/jenkins-x-labs/trigger-pipeline/pkg/cmd"
	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:   "jxl",
		Short: "Experimental labs commands for working with Jenkins X",
		Long: `These are experimental commands that are likely to change and could be removed

Commands can mature to alpha and beta phases before being accepted into the core jx command
Complete documentation is available at https://jenkins-x.io
`,
	}
)

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	common.TopLevelCommand = "boot"
	common.BinaryName = "jxl boot"

	f := clients.NewFactory()
	commonOptions := opts.NewCommonOptionsWithTerm(f, os.Stdin, os.Stdout, os.Stderr)

	// lets default to helm 3
	commonOptions.SetHelm(helm.NewHelmCLI("helm", helm.V3, "", false))

	rootCmd.AddCommand(create.NewCmdCreateProject(commonOptions))
	rootCmd.AddCommand(cmd.Main())
	rootCmd.AddCommand(goreleaser.NewCmdGoReleaser())
	rootCmd.AddCommand(tp.NewCmd())

	// lets import the jx commands
	rootCmd.AddCommand(step.NewCmdStep(commonOptions))

}
