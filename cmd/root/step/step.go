package step

import (
	"github.com/jenkins-x-labs/jxl/cmd/root/step/get"
	goreleaser "github.com/jenkins-x-labs/step-go-releaser/pkg"
	"github.com/jenkins-x/jx/pkg/cmd/config"
	"github.com/jenkins-x/jx/pkg/cmd/helper"
	"github.com/jenkins-x/jx/pkg/cmd/opts"
	step2 "github.com/jenkins-x/jx/pkg/cmd/opts/step"
	"github.com/jenkins-x/jx/pkg/cmd/step"
	"github.com/jenkins-x/jx/pkg/cmd/step/buildpack"
	"github.com/jenkins-x/jx/pkg/cmd/step/cluster"
	"github.com/jenkins-x/jx/pkg/cmd/step/create"
	"github.com/jenkins-x/jx/pkg/cmd/step/expose"
	"github.com/jenkins-x/jx/pkg/cmd/step/git"
	"github.com/jenkins-x/jx/pkg/cmd/step/nexus"
	"github.com/jenkins-x/jx/pkg/cmd/step/post"
	"github.com/jenkins-x/jx/pkg/cmd/step/pr"
	"github.com/jenkins-x/jx/pkg/cmd/step/restore"
	"github.com/jenkins-x/jx/pkg/cmd/step/scheduler"
	"github.com/jenkins-x/jx/pkg/cmd/step/syntax"
	"github.com/jenkins-x/jx/pkg/cmd/step/update"
	"github.com/jenkins-x/jx/pkg/cmd/step/verify"
	helmfilePatch "github.com/nxmatic/jxlabs-nos-yaml-patch/pkg/cmd"
	"github.com/spf13/cobra"
)

// NewCmdStep Steps a command object for the "step" command
func NewCmdStep(commonOpts *opts.CommonOptions) *cobra.Command {
	options := &step2.StepOptions{
		CommonOptions: commonOpts,
	}

	cmd := &cobra.Command{
		Use:     "step",
		Short:   "Pipeline Steps: these commands are for use inside pipelines and generally not used by developers directly",
		Aliases: []string{"steps"},
		Run: func(cmd *cobra.Command, args []string) {
			options.Cmd = cmd
			options.Args = args
			err := options.Run()
			helper.CheckErr(err)
		},
	}

	cmd.AddCommand(buildpack.NewCmdStepBuildPack(commonOpts))
	cmd.AddCommand(step.NewCmdStepChangelog(commonOpts))
	cmd.AddCommand(cluster.NewCmdStepCluster(commonOpts))
	cmd.AddCommand(create.NewCmdStepCreate(commonOpts))
	cmd.AddCommand(expose.NewCmdStepExpose(commonOpts))
	cmd.AddCommand(get.NewCmdStepGet(commonOpts))
	cmd.AddCommand(git.NewCmdStepGit(commonOpts))
	cmd.AddCommand(step.NewCmdStepGpgCredentials(commonOpts))
	cmd.AddCommand(step.NewCmdStepLinkServices(commonOpts))
	cmd.AddCommand(nexus.NewCmdStepNexus(commonOpts))
	cmd.AddCommand(step.NewCmdStepNextVersion(commonOpts))
	cmd.AddCommand(step.NewCmdStepNextBuildNumber(commonOpts))
	cmd.AddCommand(pr.NewCmdStepPR(commonOpts))
	cmd.AddCommand(post.NewCmdStepPost(commonOpts))
	cmd.AddCommand(step.NewCmdStepRelease(commonOpts))
	cmd.AddCommand(step.NewCmdStepReplicate(commonOpts))
	cmd.AddCommand(step.NewCmdStepSplitMonorepo(commonOpts))
	cmd.AddCommand(syntax.NewCmdStepSyntax(commonOpts))
	cmd.AddCommand(step.NewCmdStepTag(commonOpts))
	cmd.AddCommand(step.NewCmdStepValidate(commonOpts))
	cmd.AddCommand(verify.NewCmdStepVerify(commonOpts))
	cmd.AddCommand(step.NewCmdStepWaitForArtifact(commonOpts))
	cmd.AddCommand(step.NewCmdStepWaitForChart(commonOpts))
	cmd.AddCommand(step.NewCmdStepStash(commonOpts))
	cmd.AddCommand(step.NewCmdStepUnstash(commonOpts))
	cmd.AddCommand(step.NewCmdStepValuesSchemaTemplate(commonOpts))
	cmd.AddCommand(scheduler.NewCmdStepScheduler(commonOpts))
	cmd.AddCommand(config.NewCmdStepPatchConfigMap(commonOpts))
	cmd.AddCommand(update.NewCmdStepUpdate(commonOpts))
	cmd.AddCommand(step.NewCmdStepOverrideRequirements(commonOpts))
	cmd.AddCommand(restore.NewCmdStepRestore(commonOpts))
	cmd.AddCommand(goreleaser.NewCmdGoReleaser())
	cmd.AddCommand(helmfilePatch.NewCmd(commonOpts))

	return cmd
}
