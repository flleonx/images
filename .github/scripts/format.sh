#!/bin/bash

files=$(for file in "$@"; do echo "$file" | sed 's/\/Dockerfile$//'; done | awk '!a[$0]++' | jq -ncR '[inputs | select(length>0)]')
echo "files=${files}" >> $GITHUB_OUTPUT
