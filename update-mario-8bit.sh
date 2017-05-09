#!/bin/bash 

YAML=packs/mario-8bit.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/mario-8bit.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	(
	set -x
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/mario-8bit/assets/$IMAGE" >>$YAML
	)
    fi
done

git add $0 assets packs
git commit -m "added these mario-8bit $NAMES"
git push


