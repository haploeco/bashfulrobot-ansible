#!/bin/bash

## WIP - just experimenting with git commands

if [[ -z $(git status -s) ]]; then

echo "has update"
else
echo "no update"
fi