set shell := ["nu", "-c"]

default:
    just --list

check:
    nix flake check

test:
    sudo nixos-rebuild test --verbose --show-trace --print-build-logs

switch:
    git add .
    git commit -m 'after test, burn into boot'
    sudo nixos-rebuild switch
    git push

edit:
    emacs -nw home.nix
