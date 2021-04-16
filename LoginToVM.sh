#!/usr/bin/expect

#Increase timeout incase your VM is slow.
set timeout 3
set action [lindex $argv 0];
set host "enter host"
set ip "enter ip"
set password "enter password"

#ssh into VM
spawn ssh $host@$ip
expect "password"
send "$password\r"
expect "$"
send "sudo -i\r"
expect "password"
send "$password\r"

#Take action based on the argument
if { $action == "docker" } {
    expect "$"
    #This will only work if you have a single container running, if you have multiple containers remove "\$(docker ps -q)" and paste your container id
    send "docker exec -it \$(docker ps -q) bash\r"
} elseif { $action == "jetty"} {
    expect "$"
    #Jetty Server Folder
    send "cd /var/lib/docker/volumes/shared/_data/jetty/jetty-distribution-9.4.38.v20210224/\r"
    expect "$"
    #Kills the process running in the port
    send "kill \$(lsof -t -i:12345)\r"
    expect "$"
    #Starts the Server
    send "java -jar start.jar\r"
}

interact

