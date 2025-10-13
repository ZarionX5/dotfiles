#!/bin/bash

INSTALL_CMD='sudo apt install'
UPDATE_CMD='sudo apt update'
ADD_REPOS_CMD='sudo apt-add-repository'

function base_setting {
  local base_pkg=(
    git
    curl
    wget
  )
    local font_fm='CommitMono'

  echo "# base_setting"
  echo "${INSTALL_CMD} ${base_pkg[*]}"

  echo "mkdir -p ~/.local/share/fonts"
  echo "cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/${font_fm}.zip && unzip ${font_fm}.zip -d ${font_fm} && fc-cache -f"
}

function cli_setting {
  local cli_pkg=(
    htop
    lf
    neofetch
  )
  echo "# cli_setting"
  echo "${INSTALL_CMD} ${cli_pkg[*]}"

  echo "curl -sS https://starship.rs/install.sh | sh"
}

function gui_setting {
  local gui_pkg=(
    vlc
    google-chrome
  )

  echo "# gui_setting"
  echo "${INSTALL_CMD} ${gui_pkg[*]}"
}

function c_cpp_setting {
  local c_cpp_pkg=(
    make
    gcc
    cppcheck
    clang-format
    valgrind
  )

  echo "# c_cpp_setting"
  echo "${INSTALL_CMD} ${c_cpp_pkg[*]}"
}

function programming_setting {
  local programming_pkg=(
    ca-certificates
    make
    fish
  )
  local programming_reps=(
    "ppa:fish-shell/release-4"
  )
  echo "# programming_setting"

  echo "${ADD_REPOS_CMD} ${programming_reps[*]}"
  echo "${UPDATE_CMD}"
  echo "${INSTALL_CMD} ${programming_setting[*]}"

  echo "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

  echo "fisher install jorgebucaran/nvm.fish"

  echo "fisher install joseluisq/gitnow@2.13.0"

  echo "sudo install -m 0755 -d /etc/apt/keyrings"
  echo "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc"
  echo "sudo chmod a+r /etc/apt/keyrings/docker.asc"
  echo 'echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'
  echo "sudo apt-get update"
  echo "sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"

  echo "curl -LsSf https://astral.sh/uv/install.sh | sh"

  echo "curl -fsSL https://pyenv.run | bash"
  echo "pyenv install 3.12"
  echo "pyenv global 3.12"

  echo "curl -fsSL https://get.pnpm.io/install.sh | sh -"

  echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash"
  echo "nvm install --lts"
  echo "nvm use --lts"
}
