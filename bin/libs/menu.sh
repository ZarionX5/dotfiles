#!/bin/bash


function read_cursor {
  local curs="$1"
  local curs_max="$2"
  local input=""
  read -rsn 3 input

  if [[ `printf "%X" "'${input:0}'"` == "1B" && `printf "%X" "'${input:1}'"` == "5B" ]]; then
    if [ "${input:2}" == "A" ]; then
      if [ "$curs" -gt 0 ]; then
        curs=$((curs - 1))
      fi
    elif [ "${input:2}" == "B" ]; then
      if [ "$curs" -lt "$curs_max" ]; then
        curs=$((curs + 1))
      fi
    fi
  elif [[ `printf "%X" "'${input:0}'"` == "27" ]]; then
    curs=""
  fi

  echo "${curs}"
}

function print {
  echo -n "{$1}"
}

function draw_selected {
  local output="$1"
  local is_selected="$2"

  if [is_selected == "0"]; then
    output=">${output}"
  fi

  echo "${output}"
}

function draw_button {
  local title="$1"
  local is_selected="$2"

  local output=$(draw_selected "${title}")

  print "${output}"
}

function draw_textbox {
  local title="$1"
  local is_selected="$2"
  local input_var="$3"

  local output=$(draw_selected "${title}: ${input_var}")

  print "${output}"
}

function draw_checkbox {
  local title="$1"
  local is_selected="$2"
  local input_var="$3"

  local output="${title}"
  if ["${input_var}" == "0" || "${input_var,,}" == "false" || "${input_var,}" == "f" || -z "${input_var}"]; then
    output="${output}: -"
  else
    output="${output}: +"
  fi

  local output=$(draw_selected "${output}")

  print "${output}"
}



list_type_name=(
  'button',
  'textbox',
  'checkbox',
)

list_type_fn_draw=(
  draw_button,
  draw_textbox,
  draw_checkbox,
)

list_type_fn_draw_args=(
  2,
  3,
  3,
)

function menu_list_len {
  local list_type="$1"

  echo "${list_type}"
  local i=0
  local j=0
  while true; do

  done
}

function draw_menu {
  local title="$1"
  local list_type="$2"
  # local list_init_args="$3"

  local cursor=0
  while true; do
    clear

    local i=0
    while true; do
      i=$(( $i + 1 ))

    done

    cursor="${read_cursor "${cursor}" "${#list_type[*]}"}"

    if [[ -z "$cursor" ]]; then
      break
    fi

  done
}

var_test=0
# read_cursor ${var_test} 4
# echo "${#list_type_name[*]}"

list_type_=(
  'button' ''
)

# draw_menu "test menu"

i=0
while [ "${i}" -le 5 ]; do
  i=$(( i + 1 ))
  echo "${i}"
done
