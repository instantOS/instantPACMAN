#!/bin/bash

curl -s 'https://aur.archlinux.org/rpc' -d "arg=$1" -d "v=5" -d "type=suggest" | jq -r '.[]'
