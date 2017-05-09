#!/bin/bash 

YAML=packs/skype.yaml

for IMAGE in $( cd assets ; ls )
do 
    if ! grep $IMAGE packs/skype.yaml >/dev/null; then 
	NAME=$( echo $IMAGE | cut -f 1 -d . ) 
	NAMES="$NAMES $NAME"
	(
	set -x
	echo "  - name: $NAME" >>$YAML
	echo "    src: https://github.com/bdobyns/emojipacks/raw/skype/assets/$IMAGE" >>$YAML
	)
    fi
done

git add $0 assets packs
git commit -m "added these skype $NAMES"
git push


