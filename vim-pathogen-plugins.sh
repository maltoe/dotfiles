#!/bin/bash
if [ $# -eq 0 ]; then
  tail -n +19 "$0"
else
  if [ "$1" = "update" ]; then
    head -n 18 $0 > /tmp/$0.tmp
    (
      for i in $HOME/.vim/bundle/*; do echo -e "$(basename $i)\t\t\t$(cd $i; git rev-parse HEAD 2>/dev/null)"; done
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
ctrlp.vim			6e2f8d31ff97540849a4dfe5645c0084148d4920
editorconfig-vim			ef035f51af3adb429aedb0f82f27fdd523f6bb35
neocomplete.vim			a21f22f19d6dbd0fb0d58b555c186138c4c9cfc9
nerdtree			4ebbb533c3faf2c480211db2b547972bb3b60f2b
tagbar			7b36c46d17d57db34fdb0adac9ba6382d0bb5e66
vim-distinguished			62b360dc81355b53d124cd06218a9ba2496563fc
vim-easymotion			649120e90e92bc2ae5361693fa1e4dd2d02c1822
vim-fugitive			008b9570860f552534109b4f618cf2ddd145eeb4
vim-sensible			2fb074e84169e177045e8bdb6ceb7eded3a80e8f
vim-trailing-whitespace			478b217d299b6f5938b43a4929d6bb0907cc3a56
