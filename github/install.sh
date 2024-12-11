#!/bin/sh

# clean workspace folder
rm -rf /workspaces/obsidian
mkdir /workspaces/obsidian
ln -s /workspaces/obsidian ~/Projects
git init /workspaces/obsidian

cd ~

exit 0