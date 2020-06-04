set -x

$(git rev-parse --is-shallow-repository) && git fetch --unshallow
git fetch origin --tags

up=$(expr $(git describe --abbrev=0 --match='v[0-9]*.[0-9]*.[0-9]*[!-]*') : 'v\(.*\)')
last=$(git describe --abbrev=0 --tags --match="${up}-jxlabs-nos-*" 2>/dev/null)
if [ $? -eq 0 ] ; then
  next=$(expr $(expr $last : "${up}-jxlabs-nos-\(.*\)") + 1)
else
  next=1
fi
version=${up}-jxlabs-nos-${next}

git tag ${version}
git push origin ${version}

echo $version > VERSION
