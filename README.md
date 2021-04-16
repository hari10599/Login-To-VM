# Login-To-VM

This script is for those who are tired of logging into a VM and executing a specific task always.

## User Manual

i. To give executable permissions for the file
```
chmod +x LoginToVM.sh
```

ii. Enter the hostname, IP and password of the VM. If your hostname or password has any special characters like '$', use escape sequence character before it like '\\$'. **Ps: VM details are not saved or sent anywhere.**

iii. If you don't have any custom task, run the below command to login to your VM as **sudo** user.
```
./LoginToVM.sh
```

iv. To run a custom task, add the task in the LoginToVM.sh script and pass it as an argument.
```
./LoginToVM.sh docker
```

## Tasks

i. **docker** - If you have a single container running, use this to go inside the container.

ii. **jetty** - To start a jetty server
