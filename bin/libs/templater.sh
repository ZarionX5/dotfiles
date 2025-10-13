#!/bin/bash


function create_template {
  local template_file="$1"
  local result_file="$2"

  eval "echo -e \"$(< "${template_file}")\"" > "${result_file}"
}

function create_templates {
  local template_dir="$1"
  local result_dir="$2"

  local templates=( $(ls "${template_dir}") )
  for file in ${templates[*]}
  do
    # printf "%d %s\n" "$i" "$file"
    # eval "echo -e \"$(< "${template_dir}/${file}")\"" > "${result_dir}/${file}"
    create_template "${template_dir}/${file}" "${result_dir}/${file}"
  done
}

# create_templates "$@"
