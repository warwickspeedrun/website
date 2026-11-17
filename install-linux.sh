#!/bin/bash
rm -f zola*-linux-gnu.tar.gz
# Get release info
release_data=$(curl -s https://api.github.com/repos/getzola/zola/releases/387717878)
release_download=$(echo "$release_data" | grep browser_download_url | grep "$(uname -m)-unknown-linux-gnu.tar.gz" | cut -d '"' -f 4)

echo "Downloading $release_download"
wget -q --show-progress "$release_download"
mkdir -p bin

echo "Extract to ./bin"
tar -xvf zola*-linux-gnu.tar.gz -C "bin"

rm -f zola*-linux-gnu.tar.gz