#!/bin/bash
#
#bash script para Linux para verificação da integridade e autenticidade do software
#

release_sig=$1

if [[ -z $release_sig ]] ; then
  printf "\n\nUsage: ./verify.sh release_sig\n"
  exit 0
fi

gpg --verify-files $release_sig

sha256sum --ignore-missing -c $release_sig
