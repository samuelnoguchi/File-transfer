#!/bin/ksh

curdir=$(pwd)

. ./variables.env

cd $curdir/Files

#Prepare Log Files

if [[ ! -d ${LOG_DIR} ]]; then
	mkdir ${LOG_DIR}
	if [ $? -ne 0 ]; then
		printf "%s - ERR - "log folder cannot be created. Process stopped.""
		exit
	fi
fi	

if [[ ! -e ${LOG} ]]; then
	touch ${LOG}
	if [ $? -ne 0 ]; then
		printf "%s - ERR - "log file cannot be created. Process stopped.""
		exit
	fi
fi

echo "***************BEGIN LOG*******************" >> ${LOG} 

#Select file

targets=(${TARGET})

if [[ "${targets}" != "$TARGET" ]]; then
	newest=${targets[-1]}	
else
	echo "NO FILES SELECTED" >>${LOG}
	echo "*******************************************" >>${LOG}
	exit
fi

mv ${targets} ../Archive

echo ARCHIVED: ${targets} >>${LOG}
echo "*******************************************" >>${LOG}