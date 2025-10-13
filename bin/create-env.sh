#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/libs/templater.sh"
source "${SCRIPT_DIR}/libs/gitconfig.sh"

function set_git_env {
  if [ -n "${GITHUB_USER}" ]; then
    local github=( $(get_github_by_url "${GITHUB_USER}") )

    export GITHUB_USER_NAME="${github[1]}"
    export GITHUB_USER_EMAIL="${github[2]}"
  fi

  if [ -n "${GITLAB_USER}" ]; then
    local gitlab=( $(get_gitlab_by_url "${GITLAB_USER}") )

    export GITLAB_USER_NAME="${gitlab[1]}"
    export GITLAB_USER_EMAIL="${gitlab[2]}"
  fi
}

function setting_env {
  set_git_env
}

function create_env {
  if [ -r "${SCRIPT_DIR}/../pre-env.sh" ]; then
    source "${SCRIPT_DIR}/../pre-env.sh"

    setting_env

    create_template "${SCRIPT_DIR}/env.sh" "${SCRIPT_DIR}/../env.sh"
    rm -f "${SCRIPT_DIR}/../pre-env.sh"
  else
    echo "You need to prepare the environment for this use the script \"prepare-env.sh\"."
  fi
}

create_env
