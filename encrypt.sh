#!/bin/bash

echo "Encrypt File/Folder"
echo "Place in the same folder, where a file to be encrypted is present"
echo "Enter the Exact File Name with extension"
read -r file

# Encryption Command
gpg \
	--symmetric \
 	"$file"
echo "File Encryption Sucessfully"

# Decryption Command
#gpg \
#	--decrypt \
#	filename.gpg > filename
#echo "File Decryption Sucessfully"

echo "Removing Original File"
rm \
	--recursive \
 	--force \
  	"$file"
