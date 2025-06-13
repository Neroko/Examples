#!/bin/bash

rsync \
	--archive \
 	--verbose \
  	--compress \
	-e "ssh " /path/to/yourfile user@backupserver.com:/backup/

echo "Backup for $(date) " | mail -s "Backup Complete" user@youremail.com
