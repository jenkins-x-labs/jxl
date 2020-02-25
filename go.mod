module github.com/jenkins-x-labs/jx-labs

go 1.12

require (
	github.com/jenkins-x-labs/helmboot v0.0.0-20200225102046-31e8c678e067
	github.com/jenkins-x-labs/jwizard v0.0.0-20200219080758-8315fbed0d62
	github.com/jenkins-x-labs/step-go-releaser v0.0.3
	github.com/jenkins-x-labs/step-parse-git-credentials-token v0.0.0-20200220174420-86b533059751
	github.com/jenkins-x/jx v0.0.0-20200207164408-3e719ca49349
	github.com/mitchellh/go-homedir v1.1.0
	github.com/spf13/cobra v0.0.5
	github.com/spf13/viper v1.6.2
)

replace github.com/coreos/go-systemd => github.com/coreos/go-systemd/v22 v22.0.0

replace k8s.io/api => k8s.io/api v0.0.0-20190528110122-9ad12a4af326

replace k8s.io/metrics => k8s.io/metrics v0.0.0-20181128195641-3954d62a524d

replace k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190221084156-01f179d85dbc

replace k8s.io/client-go => k8s.io/client-go v0.0.0-20190528110200-4f3abb12cae2

replace k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20190528110544-fa58353d80f3

replace git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999

replace github.com/sirupsen/logrus => github.com/jtnord/logrus v1.4.2-0.20190423161236-606ffcaf8f5d

replace github.com/Azure/azure-sdk-for-go => github.com/Azure/azure-sdk-for-go v21.1.0+incompatible

replace github.com/Azure/go-autorest => github.com/Azure/go-autorest v10.14.0+incompatible

replace github.com/banzaicloud/bank-vaults => github.com/banzaicloud/bank-vaults v0.0.0-20190508130850-5673d28c46bd

replace github.com/russross/blackfriday => github.com/russross/blackfriday v1.5.2
