#!/usr/bin/env bash

cat .vscode/extensions | xargs -L 1 code --install-extension
