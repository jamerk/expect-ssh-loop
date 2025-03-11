# Simple SSH Expect Script Loop
Simple set of scripts to ssh to devices in a list and perform commands against them with expect. This is just for situations where you need to use ssh password authentication, hence the need for expect. 

# Using the Scripts
1) Edit commands.sh and put in the commands you want to run on each host
2) Edit host_list.txt and put all of your hosts you want to run the commands against in there, one host per line
3) Then run loop.sh
