alias b := build
alias c := clean
alias fmt := formatting

export JUST_UNSTABLE := "1"

build: build_laptop

build_laptop:
    nh os switch -H laptop

dev:

check:
    find . -name "*.nix" -exec nixfmt --check {} +

formatting:
    just --fmt
    find . -name "*.nix" -exec nixfmt {} +

clean:
