alias b := build
alias t := test
alias c := clean
alias fmt := formatting

export JUST_UNSTABLE := "1"

build: build_laptop

build_laptop:
    nh os switch -H laptop

dev:

test:

formatting:
    just --fmt
    nixfmt *.nix

clean:
