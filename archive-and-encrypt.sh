#!/bin/bash

name="$1"
path="$2"

tar -c -z -v -f ""$name".tar.gz" "$path"

gpg -c ""$name".tar.gz"

rm -r -f ""$name".tar.gz"
