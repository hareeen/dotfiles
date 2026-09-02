set shell := ["fish", "-c"]

export NH_FLAKE := justfile_directory()

rebuild := if os() == "macos" { "darwin" } else { "os" }

default:
    @just --list

# Stage everything so the flake sees new files, then activate this machine
local:
    git add . && just activate

# Build and activate a NixOS/nix-darwin configuration (defaults to this host)
activate host="":
    nh {{ rebuild }} switch {{ if host == "" { "" } else { "--hostname " + host } }}

# Build and activate a Home Manager configuration
home configuration:
    nh home switch --configuration {{ configuration }}

update:
    nix flake update

fmt:
    treefmt

# Run every git hook, including the pre-push linters
lint:
    pre-commit run --all-files
    pre-commit run --all-files --hook-stage pre-push
