#!/bin/bash

addUsers() {
    
    # Siblings users are created and a default password is set for the sake of testing
    useradd -m -d /home/$name $name >/dev/null
    echo "$name:password" | sudo chpasswd
    touch /home/$name/website.txt
    setfacl -m u:bigBrother:rwx /home/$name/website.txt
    chmod 400 /home/$name/website.txt


    # A message is displayed on the student being generated
    echo "User $name has been generated"
}

if [ ! -d "/home/Alice" ]; then

	while read -r name sibling_no; do
		addUsers	
	done < /home/bigBrother/user_info.txt

#Does the same as above except in this case we are adding Sibling if they are submitted while running the script
else
    name=$1
	addUser
fi