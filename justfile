set shell := ["fish", "-c"]

default:
    @just --list

local:
    git add . && nix run . &| nom

pca:
    pre-commit run --all-files
