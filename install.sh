#!/bin/bash

install_config() {
  local -r source_file=$(pwd)
  local -r destination_file=$HOME/.config/kitty

  # Remove existing kitty config if presen
  if [ -e "$destination_file" ]; then
    read -p "Existing kitty config found at $destination_file. Remove it and continue to install? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      rm -rf "$destination_file"
    else
      echo "Installation cancelled."
      exit 1
    fi
  fi

  ln -s "$source_file" "$destination_file"
  echo "Install success, please re-open Kitty terminal"
}

# run install
install_config
