#!/bin/sh
if [ $# -eq 0 ]; then
  tail -n +19 "$0"
else
  if [ "$1" = "update" ]; then
    head -n 19 $0 > /tmp/$0.tmp
    (
      for i in $HOME/.vim/bundle/*; do echo "$i\t\t\t$(cd $i; git rev-parse HEAD 2>/dev/null)"; done
    ) >> /tmp/$0.tmp
    mv /tmp/$0.tmp $0
    chmod +x $0
    $0
  else
    echo "Usage: $0 [update]"
    exit 1
  fi
fi
exit 0
/home/malte/.vim/bundle/neocomplete.vim			
/home/malte/.vim/bundle/neocomplete.vim			
/home/malte/.vim/bundle/neosnippet.vim			
/home/malte/.vim/bundle/nerdtree			
/home/malte/.vim/bundle/tagbar			
/home/malte/.vim/bundle/vim-distinguished			
/home/malte/.vim/bundle/vim-easymotion			0806257ca6432ac7beb75c4319dadf7f3ba9907b
/home/malte/.vim/bundle/vim-sensible			
/home/malte/.vim/bundle/vim-trailing-whitespace			
