#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/libs/pkg.sh"

function slim_pkg {
  echo "$(cli_setting)"
}

function default_pkg {
  echo "$(slim_pkg)"
  echo "$(programming_setting)"
}

function full_pkg {
  echo "$(default_pkg)"
  echo "$(c_cpp_setting)"
  echo "$(gui_setting)"

}

full_pkg
