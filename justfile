set shell := ["fish", "-c"]

default:
    @just --list

local:
    git add . && nix run . &| nom
