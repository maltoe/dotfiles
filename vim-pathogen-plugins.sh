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
ctrlp.vim			28fce0fb860fe8df0915da1de1fb6e90d6ab2edc
editorconfig-vim			ef035f51af3adb429aedb0f82f27fdd523f6bb35
neocomplete.vim			a21f22f19d6dbd0fb0d58b555c186138c4c9cfc9
nerdtree			4ebbb533c3faf2c480211db2b547972bb3b60f2b
tagbar			7b36c46d17d57db34fdb0adac9ba6382d0bb5e66
vim-airline			4d39cb6f2078326dd07f2ab680a0365299a2589e
vim-distinguished			62b360dc81355b53d124cd06218a9ba2496563fc
vim-easymotion			5c6f3cd9a713491e6b32752a05c45198aa91540a
vim-fugitive			3439f999b138254e4bb56187fc91f91f545b4b12
vim-sensible			2fb074e84169e177045e8bdb6ceb7eded3a80e8f
vim-trailing-whitespace			478b217d299b6f5938b43a4929d6bb0907cc3a56
