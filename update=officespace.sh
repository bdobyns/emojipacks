#!/bin/bash 

YAML=packs/officespace.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/officespace.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	(
	set -x
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/officespace/assets/$IMAGE" >>$YAML
	)
    fi
done

git add $0 assets packs
git commit -m "added these officespace $NAMES"
git push


