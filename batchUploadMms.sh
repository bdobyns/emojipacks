#!/bin/bash

subdomain='mms-org'
password='carved-cracks-21522'
email='barry@productops.com'
#subdomain=productops
#password='SL$xjw848tx'


if [[ $1 -eq 0 ]] ; then
  path='./packs'
else
  path="$1"
fi

for f in "$path"/*.yaml "$path"/futurama.yaml "$path"/starwars.yaml
do
  if [ -e $f ] ; then
  emojipacks -s $subdomain -e $email -p "$password" -y $f;
done
