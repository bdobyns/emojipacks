#!/bin/bash 

YAML=packs/nekoatsume.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/nekoatsume.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	(
	set -x
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/nekoatsume/assets/$IMAGE" >>$YAML
	)
    fi
done

git add $0 assets packs
git commit -m "added these nekoatsume $NAMES"
git push


