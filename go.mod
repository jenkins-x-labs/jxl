module github.com/jenkins-x-labs/jxl

go 1.13

require (
	github.com/blang/semver v3.5.1+incompatible
	github.com/jenkins-x-labs/helmboot v0.0.90
	github.com/jenkins-x-labs/jwizard v0.0.15
	github.com/jenkins-x-labs/step-go-releaser v0.0.18
	github.com/jenkins-x-labs/trigger-pipeline v0.0.4
	github.com/jenkins-x/helm-unit-tester v0.0.6
	github.com/jenkins-x/jx-api v0.0.13
	github.com/jenkins-x/jx-logging v0.0.11
	github.com/jenkins-x/jx/v2 v2.1.97
	github.com/nuxeo/jxlabs-nos-yaml-patch v0.0.5
	github.com/pkg/errors v0.9.1
	github.com/spf13/cobra v1.0.0
	github.com/stretchr/testify v1.6.1
)

replace github.com/jenkins-x-labs/helmboot => github.com/nuxeo/jxlabs-nos-helmboot v0.0.90-4-6e578c51-master

replace github.com/jenkins-x-labs/jwizard => github.com/nuxeo/jxlabs-nos-jwizard v0.0.18-2-b1f769a4-master

replace github.com/jenkins-x-labs/step-go-releaser => github.com/nuxeo/jxlabs-nos-step-go-releaser v1.13.15-2-37f2a611-master

replace github.com/jenkins-x-labs/trigger-pipeline => github.com/nuxeo/jxlabs-nos-trigger-pipeline v0.1.0-4-516670ee-master

replace github.com/jenkins-x/jx/v2 => github.com/nuxeo/jxlabs-nos-jx/v2 v2.1.1

replace code.gitea.io/sdk => github.com/go-gitea/go-sdk v0.0.0-20180702024448-79a281c4e34a

replace github.com/coreos/go-systemd => github.com/coreos/go-systemd/v22 v22.0.0

replace github.com/russross/blackfriday => github.com/russross/blackfriday v1.5.2

replace k8s.io/api => k8s.io/api v0.16.5

replace k8s.io/metrics => k8s.io/metrics v0.0.0-20190819143841-305e1cef1ab1

replace k8s.io/apimachinery => k8s.io/apimachinery v0.16.5

replace k8s.io/client-go => k8s.io/client-go v0.16.5

replace k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20190819143637-0dbe462fe92d

replace git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999

replace github.com/sirupsen/logrus => github.com/jtnord/logrus v1.4.2-0.20190423161236-606ffcaf8f5d

replace github.com/Azure/azure-sdk-for-go => github.com/Azure/azure-sdk-for-go v23.2.0+incompatible

replace github.com/Azure/go-autorest => github.com/Azure/go-autorest v13.3.1+incompatible

replace github.com/banzaicloud/bank-vaults => github.com/banzaicloud/bank-vaults v0.0.0-20191212164220-b327d7f2b681

replace github.com/banzaicloud/bank-vaults/pkg/sdk => github.com/banzaicloud/bank-vaults/pkg/sdk v0.0.0-20191212164220-b327d7f2b681

replace k8s.io/test-infra => github.com/jenkins-x/test-infra v0.0.0-20200611142252-211a92405c22

replace gomodules.xyz/jsonpatch/v2 => gomodules.xyz/jsonpatch/v2 v2.0.1
