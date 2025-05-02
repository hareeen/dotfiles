set shell := ["fish", "-c"]

default:
    @just --list

local:
    git add . && nix run . &| nom

update:
    nix flake update

pca:
    pre-commit run --all-files
