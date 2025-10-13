#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${SCRIPT_DIR}/libs/templater.sh"

function prepare_env {
  create_template "${SCRIPT_DIR}/pre-env.sh" "${SCRIPT_DIR}/../pre-env.sh"
}

prepare_env
