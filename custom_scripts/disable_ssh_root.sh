#!/usr/bin/env bash
if [ "$#" -ne 1 ]; then
	echo "Correct syntax: $0 remote_server";
	exit
fi
SSHD_CONFIG="/etc/ssh/sshd_config"
SSH_SERVICE="/etc/init.d/ssh"
ssh -q root@$1 "adduser $USER"
if [ "$?" -ne 0 ]; then 
	echo "* Unable to connect to $1 with root";
	exit;
fi

#Set AllowUsers in sshd_config to allow your user to enter
#Disable root login
#Restart sshd

ssh root@$1 "echo \"*** Changing SSH configuration for $1 ***\";"\
	"if grep -q -e ^AllowUsers.* $SSHD_CONFIG; then"\
		"sed -i -e \"s/AllowUsers.*/AllowUsers $USER/\" $SSHD_CONFIG;"\
	"else"\
		"echo \"AllowUsers $USER\" >> $SSHD_CONFIG;"\
	"fi;"\
	"echo \"* $1 only allow user $USER in via SSH from now on\";"\
	"sed -i -e \"s/.*PermitRootLogin.*/PermitRootLogin no/\" $SSHD_CONFIG;"\
	"echo \"* Root login disabled on $1\";"\
	"echo \"* Restarting sshd...\";"\
	"$SSH_SERVICE restart;"
if [ "$?" -ne 0 ]; then 
	echo "* An error happened while executing the remote commands on $1";
	exit;
fi
sleep 2;
echo "* Sending public key to host machine to skip password authentication";
ssh-copy-id $USER@$1
if [ "$?" -ne 0 ]; then 
	echo "* An error happened while sending your public key to $1";
	exit;
fi
echo "* You'll be able to connect to the remote server with the following command: \"ssh $1\"";
