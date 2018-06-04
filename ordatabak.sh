#!/bin/sh 
#===============================================================================
#
#          FILE: ordatabak.sh
#
#         USAGE: ./ordatabak.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2018/05/21 15时07分46秒
#      REVISION:  ---
#===============================================================================

export ORACLE_SID=orcl
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1
export NLS_LANG=american_america.zhs16gbk
export DATA_DIR=/backup/oracledata
now=` date +%Y%m%d%H%M%S `
dmpfile=db$now.dmp
echo start exp $dmpfile ...
/u01/app/oracle/product/11.2.0/dbhome_1/bin/expdp system/123456 DUMPFILE=$dmpfile logfile=db$now.log DIRECTORY=expdp_bak_dir full=y
echo "Delete the file bakup before 6 days..."
find /backup/oracledata/ -mtime +6 -name "*.dmp" -exec rm -rf '{}' \; 
echo "Delete the file bakup successfully. "
echo "Bakup completed."

