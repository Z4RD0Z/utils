#!/bin/bash

#
# This script dumps your database in a folder on your server.
# 
# Set your cron to schedule dump periodically
#

# Set your database name 
db_name='moodle';

# Set your username
db_user='moodler';

# Set your password
db_pass='moodlerpassword';

# Set your system's path where store dumps
dumps_dir="/tmp/";

# Set your dump command
dump_command_path='/usr/bin/mysqldump';

# Set your compression command
zip_command_path='/bin/gzip';

# Get the current datatime
CURRENT_DATETIME=`date +%Y%m%d%H%M%S`;

dump_name="${CURRENT_DATETIME}.${db_name}.dump.sql";
dump_path="${dumps_dir}${dump_name}";

# Database's dump
"${dump_command_path}" --single-transaction -u "${db_user}" -p${db_pass} "${db_name}" > "${dump_path}";

# Dump compression using gzip
${zip_command_path} "${dump_path}";
