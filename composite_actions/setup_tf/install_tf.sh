#!/bin/bash

while getopts ":v:" opt; do
  case $opt in
    v)
      tf_version="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

if [ -z "$tf_version" ]; then
  echo -e "\nPlease pass -v <version> to run this command!\n"
  exit 1
fi

wget https://releases.hashicorp.com/terraform/"$tf_version"/terraform_"$tf_version"_linux_amd64.zip
unzip terraform_"$tf_version"_linux_amd64.zip
sudo mv terraform /usr/local/bin/