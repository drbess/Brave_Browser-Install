#!/bin/bash


# New Update 2020-12-26          
# Brave Browser Install       
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
        echo "What's good $USER! I will now install. "
        sleep 5
}
install-configure_brave() {
        echo "Configuring the repo"
        dnf install dnf-plugins-core
	sleep 5
	dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
	sleep 5
	rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
	sleep 5
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
install-configure_brave
cleanuptime
bounce
