#!/usr/bin/env zsh

# taken from http://makandracards.com/jan0sch/15473-script-to-update-vim-pathogen-and-bundles
which curl >/dev/null || {
  echo "curl not found in path..."
  exit 1
}
which git >/dev/null || {
  echo "git not found in path..."
  exit 1
}

PATHOGEN_DIR="${HOME}/.vim/autoload"
BUNDLES_DIR="${HOME}/.vim/bundle"

if [[ -d "${PATHOGEN_DIR}" ]]; then
  echo "Updating pathogen..."
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [[ -d "${BUNDLES_DIR}" ]]; then
  echo "Updating bundles..."
  for bundle in "${BUNDLES_DIR}/"*; do
    if [[ -d "${bundle}/.git" ]]; then
      echo "Bundle: ${bundle}..."
      cd "${bundle}"
      git pull
    fi
  done
fi
