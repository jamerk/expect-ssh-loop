#!/bin/bash

# Set the name of the file that lists the hosts, one line per host
list="host_list.txt"

# Set user and password here, if you are using key auth then
# you should use a different script that I will link to here...
user=myuser
password=thepassword

# >>>> You likely do not need to edit the below <<<<

# Here the script gets upset if you did not specify a file above
if [[ ! -f ${list} ]]; then
   echo "No File Found."
   exit 1
fi

# And finally we begin looping through the hosts in the file
for host in $(cat $list); do
   ./commands.sh "$user" "$password" "$host"
done
