package version

import (
	"github.com/blang/semver"
	"github.com/pkg/errors"

	"github.com/jenkins-x/jx/v2/pkg/versionstream"
)

// GetJXLVersion returns the jxl version from the version stream
func GetJXLVersion(resolver *versionstream.VersionResolver) (semver.Version, error) {
	v, err := resolver.StableVersion(versionstream.KindPackage, "jxl")
	if err != nil {
		return semver.Version{}, errors.Wrap(err, "failed to resolve jxl package version in the version stream")
	}
	newVersion, err := semver.Make(v.Version)
	if err != nil {
		return semver.Version{}, errors.Wrapf(err, "failed to create semantic version of jxl from: %s", v.Version)
	}
	return newVersion, nil
}
