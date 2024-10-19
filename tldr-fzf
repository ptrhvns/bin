#!/usr/bin/env bash

# Use tldr command with fzf.

set -Eeuo pipefail

tldr "$(compgen -c | fzf)" | $PAGER
