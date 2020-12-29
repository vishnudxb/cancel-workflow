#!/bin/sh

set -e

curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $TOKEN" \
  https://api.github.com/repos/$REPO/actions/runs/$ID/cancel