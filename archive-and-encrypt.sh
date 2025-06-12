#!/bin/bash

name="$1"
path="$2"

tar \
  --create \
  --gzip \
  --verbose \
  --file=""$name".tar.gz" \
  "$path"

gpg \
  --symmetric \
  ""$name".tar.gz"

rm \
  --recursive \
  --force \
  ""$name".tar.gz"
