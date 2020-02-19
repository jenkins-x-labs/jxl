module github.com/jenkins-x-labs/jx-labs

go 1.12

require (
	cloud.google.com/go/pubsub v1.2.0 // indirect
	dmitri.shuralyov.com/gpu/mtl v0.0.0-20191203043605-d42048ed14fd // indirect
	github.com/antihax/optional v1.0.0 // indirect
	github.com/cncf/udpa/go v0.0.0-20200124205748-db4b343e48c1 // indirect
	github.com/coreos/bbolt v1.3.3 // indirect
	github.com/coreos/etcd v3.3.18+incompatible // indirect
	github.com/coreos/go-semver v0.3.0 // indirect
	github.com/coreos/go-systemd v0.0.0-20200109085637-d657f9650837 // indirect
	github.com/creack/pty v1.1.9 // indirect
	github.com/envoyproxy/go-control-plane v0.9.2 // indirect
	github.com/go-logfmt/logfmt v0.5.0 // indirect
	github.com/gogo/protobuf v1.3.1 // indirect
	github.com/golang/mock v1.4.0 // indirect
	github.com/google/gofuzz v1.1.0 // indirect
	github.com/google/pprof v0.0.0-20200210173600-2827a3cc57bf // indirect
	github.com/gophercloud/gophercloud v0.1.0 // indirect
	github.com/gopherjs/gopherjs v0.0.0-20200209183636-89e6cbcd0b6d // indirect
	github.com/gorilla/websocket v1.4.1 // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.2.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway v1.13.0 // indirect
	github.com/hashicorp/golang-lru v0.5.4 // indirect
	github.com/jenkins-x-labs/helmboot v0.0.0-20200219112558-25dd7ac1e8f6
	github.com/jenkins-x-labs/jwizard v0.0.0-20200219080758-8315fbed0d62
	github.com/jenkins-x/jx v0.0.0-20200207164408-3e719ca49349
	github.com/julienschmidt/httprouter v1.3.0 // indirect
	github.com/kr/pretty v0.2.0 // indirect
	github.com/kr/pty v1.1.8 // indirect
	github.com/mitchellh/go-homedir v1.1.0
	github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f // indirect
	github.com/pelletier/go-toml v1.6.0 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/prometheus/client_golang v1.4.1 // indirect
	github.com/rogpeppe/go-internal v1.5.2 // indirect
	github.com/russross/blackfriday v2.0.0+incompatible // indirect
	github.com/shurcooL/sanitized_anchor_name v1.0.0 // indirect
	github.com/smartystreets/assertions v1.0.1 // indirect
	github.com/spf13/cast v1.3.1 // indirect
	github.com/spf13/cobra v0.0.5
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/spf13/viper v1.6.2
	github.com/tmc/grpc-websocket-proxy v0.0.0-20200122045848-3419fae592fc // indirect
	github.com/ugorji/go v1.1.7 // indirect
	go.etcd.io/bbolt v1.3.3 // indirect
	go.uber.org/atomic v1.5.1 // indirect
	go.uber.org/multierr v1.4.0 // indirect
	go.uber.org/zap v1.13.0 // indirect
	golang.org/x/crypto v0.0.0-20200210222208-86ce3cb69678 // indirect
	golang.org/x/exp v0.0.0-20200207192155-f17229e696bd // indirect
	golang.org/x/image v0.0.0-20200119044424-58c23975cae1 // indirect
	golang.org/x/mobile v0.0.0-20200205170228-0df4eb238546 // indirect
	golang.org/x/tools v0.0.0-20200211183705-e2a38c836335 // indirect
	google.golang.org/api v0.17.0 // indirect
	google.golang.org/genproto v0.0.0-20200211111953-2dc5924e3898 // indirect
	google.golang.org/grpc v1.27.1 // indirect
	gopkg.in/ini.v1 v1.52.0 // indirect
	gopkg.in/yaml.v2 v2.2.8 // indirect
	k8s.io/metrics v0.17.2 // indirect
	k8s.io/utils v0.0.0-20191114184206-e782cd3c129f // indirect
	rsc.io/sampler v1.99.99 // indirect
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
