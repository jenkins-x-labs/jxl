set -x

$(git rev-parse --is-shallow-repository) && git fetch --unshallow
git fetch origin --tags

up=$(git describe --abbrev=0 --match='v[0-9]*.[0-9]*.[0-9]*[!-]*')
last=$(git describe --abbrev=0 --tags --match="${up}-jxlabs-nos-[0-9]*" 2>/dev/null)
if [ $? -eq 0 ] ; then
  next=$(expr $(expr $last : "${up}-jxlabs-nos-\(.*\)") + 1)
else
  next=1
fi
version=${up}-jxlabs-nos-${next}

echo $(expr $version : 'v\(.*\)') > VERSION
