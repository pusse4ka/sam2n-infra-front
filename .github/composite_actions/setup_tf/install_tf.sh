#!/bin/bash

if [ -z "$version" ]; then
    echo -e "\nPlease pass --version <version> to run this command!\n"
    exit 1
fi

tf_version="$version"
wget https://releases.hashicorp.com/terraform/"$tf_version"/terraform_"$tf_version"_linux_amd64.zip
unzip terraform_"$tf_version"_linux_amd64.zip
sudo mv terraform /usr/local/bin/