set shell := ["nu", "-c"]

default:
    just --list

nix-check:
    nix flake check

nix-test:
    sudo nixos-rebuild test --verbose --show-trace --print-build-logs

nix-switch:
    git add .
    git commit -m 'after test, burn into boot'
    sudo nixos-rebuild switch

edit:
    emacs -nw .
