#!/bin/bash 

YAML=packs/parrotparty.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/parrotparty.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	(
	set -x
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/parrotparty/assets/$IMAGE" >>$YAML
	)
    fi
done

git add $0 assets packs
git commit -m "added these parrotparty $NAMES"
git push


