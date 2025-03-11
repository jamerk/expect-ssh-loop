#!/usr/bin/expect -f

# Variables are set inline
set user [lindex $argv 0]
set pass [lindex $argv 1]
set h [lindex $argv 2]

# We get the date in the format we want here for our log file below.
set logdate [exec date +%Y%m%d%H%M]

# Setting a timeout of 5 seconds so this does not take forever and
# we are also skipping ssh key checks so we do not have to worry about
# accepting keys for hosts we have not ever logged into.
spawn ssh -o "ConnectTimeout=5" -o "StrictHostKeyChecking=no" $user@$h
expect "*assword*" {send "$pass\r"}

# We start logging here with the date and time in the file name.
log_file "log_$logdate.log"
# Then we also make it clear where each device connection begins in the log.
send_log "\n"
send_log ">>>>>> Connected to $i <<<<<<"

# You are logged in at this point so this next portion is
# where you can setup your commands you want to run.

# The devices I was testing this on have a $ for the prompt
# after login and I have to escape that symbol with the
# back slashes, then I'm just checking uptime in this example.
expect "*\\$*" {send "uptime\r"}


# And now that we are done we exit out
expect "*\\$*" {send "exit\r"}
expect eof
