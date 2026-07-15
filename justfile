set shell := ["fish", "-c"]

default:
    @just --list

local:
    git add . && nix run . &| nom

# Activate a local or remote NixOS/nix-darwin configuration
activate host="":
    nix run .#activate {{host}}

# Activate a local or remote Home Manager configuration
home configuration host="":
    just activate {{configuration}}@{{host}}

update:
    nix flake update

pca:
    pre-commit run --all-files
