#!/bin/bash 

YAML=packs/occupy.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/occupy.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	(
	set -x
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/occupy/assets/$IMAGE" >>$YAML
	)
    fi
done

git add $0 assets packs
git commit -m "added these occupy $NAMES"
git push


