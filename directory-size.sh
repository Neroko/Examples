#!/bin/bash

echo -n "Enter your directory: "
read -r x

du \
	--summarize \
 	--human-readable \
	"$x"
