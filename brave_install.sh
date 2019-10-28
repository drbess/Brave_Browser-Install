#!/bin/bash

###############################
# Updated 2019-10-27          #
# Brave browser Install       #
###############################


echo "Yo $USER! This script right HERE! Will install the Brave browser"
check_exit_status() {

        if [ $? -eq 0 ]
        then
           echo
           echo "Success"
           echo
        else

           echo
           echo "[ERROR] Process messed up bruh bruh!"
           echo

           read -p "The last command exited with an error. Exit script? (yes/no)" answer

           if [ "$answer" == "yes" ]
           then
                exit 1
           fi

     fi
 }
greeting() {

        echo
        echo "Hello, $USER. Let's update this system. "
        echo
}
install_brave() {
        echo "Let's add the repo first"
        dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/;
        check_exit_status
        rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc;
        echo "Ok, installing the Brave"
        echo "###################################################################################"
        dnf install brave-browser -y;
        check_exit_status

}
cleanuptime() {

        sudo dnf autoremove -y;
        check_exit_status

}
bounce() {
        echo
        echo "Done! The Brave the install has successfully been installed!"
        exit
}
greeting
install_brave
cleanuptime
bounce
