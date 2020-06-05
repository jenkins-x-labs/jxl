set -x

$(git rev-parse --is-shallow-repository) && git fetch --unshallow
git fetch origin --tags

upstream=$(expr $(git describe --abbrev=0 --match='v[0-9]*.[0-9]*.[0-9]*[!-]*') : 'v\(.*\)')
tag=$(git describe --abbrev=0 --tags --match="t${upstream}-jxlabs-nos-*" 2>/dev/null)
if [ $? -eq 0 ] ; then
  last=$(expr $tag : "t${upstream}-jxlabs-nos-\(.*\)")
else
  last=0
fi
next=$(expr $last + 1)
version=${upstream}-jxlabs-nos-${next}

git tag t$version
git push origin t$version

echo $version > VERSION

