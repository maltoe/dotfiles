#!/bin/bash

function clean_local_orphan_branches {
  local LOCAL_HEADS=$(git for-each-ref  --format='%(objectname);%(refname:short);%(upstream)' refs/heads | grep 'refs/remotes')
  for i in $LOCAL_HEADS; do
    local lc=$(echo $i | cut -d ';' -f 1)
    local lb=$(echo $i | cut -d ';' -f 2)
    local rb=$(echo $i | cut -d ';' -f 3)
    local rs=$(echo $rb | sed -e 's#refs/remotes/##g')
    local mb=$(git merge-base master $lc)

    if ! git ls-remote --exit-code . $rb >/dev/null; then
      echo -e "Local branch \e[1;32m$lb\e[0m has lost its tracked branch \e[1;31m$rs\e[0m."
      if [ "$mb" == "$lc" ]; then
        echo "It has been completely merged into master."
      else
        echo "It has NOT BEEN MERGED into master."
      fi

      read -p "Delete? (N/y) " -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        git branch -D $lb
      fi
      echo
    fi
  done
}

clean_local_orphan_branches
