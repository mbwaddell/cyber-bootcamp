#!/bin/bash

#Check if script was run with root. Exit if false.
if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
  exit
fi


#Create list of etc files
files=(
'/etc/passwd'
'/etc/shadow'
)

#Create list of commands
commands=(
  'date'
  'uname -a'
  'hostname -s'
)


#Defiine variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
execs=$(find /home -type f -perm 777)

#Check for research directory. Create it if needed.
if [ ! -d $HOME/research ]
then
  mkdir $HOME/research
fi


#Check for output file. Clear it if needed.
if [ -f $output ]
then
  rm $output
fi

#Create for loop that prints perms for each file in file list
echo -e "\nThe permissions for sensitive /etc file: \n" >> $output
for file in ${files[0]}
do
  ls -l $file >> $output
done

#Create a for loop that checks sudo permissions of each user with a home directory
for user in $(ls /home)
do
  sudo -lU $user
done

#Create bonus 2


#Script title and date of run
echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
#Display Machine Type
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
#Display username
echo -e "Uname info: $(uname -a) /n" >> $output
#Display IP info
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output
#Display Hostname
echo -e "Hostname: $(hostname -s) \n" >> $output
#Display DNS Servers info
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
#Display Memory info
echo "Memory Info:" >> $output
free >> $output
#Display CPU usage
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
#Display Disk usage
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
#Display the current user
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
#Display exec files
echo -e "\nexec Files:" >> $output
echo $execs >> $output
#Display Top 10 processes
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output
