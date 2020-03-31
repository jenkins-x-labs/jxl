module github.com/jenkins-x-labs/jxl

go 1.12

require (
	github.com/blang/semver v3.5.1+incompatible
	github.com/jenkins-x-labs/helmboot v0.0.75
	github.com/jenkins-x-labs/jwizard v0.0.15
	github.com/jenkins-x-labs/step-go-releaser v0.0.18
	github.com/jenkins-x-labs/trigger-pipeline v0.0.4
	github.com/jenkins-x/helm-unit-tester v0.0.6
	github.com/jenkins-x/jx v1.3.981-0.20200331091519-3de5a9a43c57
	github.com/pkg/errors v0.9.1
	github.com/spf13/cobra v0.0.6
	github.com/stretchr/testify v1.4.0
	github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8 // indirect
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

replace github.com/jenkins-x/jx => github.com/jenkins-x/jx v0.0.0-20200330115723-6eea554439b1
