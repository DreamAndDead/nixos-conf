set shell := ["nu", "-c"]

default:
    just --list

nix-test:
    sudo nixos-rebuild test --verbose --show-trace --print-build-logs

nix-switch:
    sudo nixos-rebuild switch

edit:
    emacs -nw .
