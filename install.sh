#!/usr/bin/env bash

# Read mappings in dotfile.loc and copy files.
while read line
do
  # Cut by multiple whitespace
  fname=$( echo $line | tr -s ' ' | cut -d ' ' -f 1 )
  floc=$( echo $line | tr -s ' ' | cut -d ' ' -f 2 )

  # evaluate floc in case of variable (e.g. $HOME)
  if [[ $floc =~ "$" ]]
  then
      floc=$( eval echo $floc )
  fi

  echo "installing $fname ..."
  /bin/ln -sf ${PWD}/files/${fname} $floc
done < dotfile.loc

echo "Success."
exit 0
