#!/bin/bash
SECONDS=0

#Check if running as root and if not elevate
amiroot=$(sudo -n uptime 2>&1| grep -c "load")
if [ "$amiroot" -eq 0 ]
then
    printf "Security Service Require Root Access. Please Enter Your Password.\n"
    sudo -v
    printf "\n"
fi

#Install Updates.
printf "Installing needed updates.\n"
softwareupdate -i -a > /dev/null 2>&1

#Taking out the trash.
printf "Emptying the trash.\n"
sudo rm -rfv /Volumes/*/.Trashes > /dev/null 2>&1
sudo rm -rfv ~/.Trash  > /dev/null 2>&1

#Clean the logs.
printf "Emptying the system log files.\n"
sudo rm -rfv /private/var/log/*  > /dev/null 2>&1
sudo rm -rfv /Library/Logs/DiagnosticReports/* > /dev/null 2>&1

printf "Deleting the quicklook files.\n"
sudo rm -rf /private/var/folders/ > /dev/null 2>&1

#Purging Memory.
printf "Purging memory.\n"
sudo purge > /dev/null 2>&1

#Securly Erasing Data.
printf "Securely erasing free space (This will take a while). \n"
diskutil secureErase freespace 0 "$( df -h / | tail -n 1 | awk '{print $1}')" > /dev/null 2>&1

#Finishing Up.
timed="$((SECONDS / 3600)) Hours $(((SECONDS / 60) % 60)) Minutes $((SECONDS % 60)) seconds"

printf "Security Service Took %s this time. Dont Forget To Tip!\n" "$timed"