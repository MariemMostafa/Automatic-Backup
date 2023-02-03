#!/usr/bin/bash

target:	sub_target
	@/home/mariem/lab2/backup/backupd.sh ./srcdir ./backupdir 2 3
	
sub_target:
	@ mkdir -p ./backupdir

