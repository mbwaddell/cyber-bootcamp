#!/bin/bash

#define variables
states=('Louisiana' 'Florida' 'California' 'Hawaii' 'Washington')
nums=$(echo {0..9})
ls_out=$(ls)
execs=$(find /home -type f -perm 777 2> /dev/null)

#Create For Loops
#Create a loop that prints 3,5, or 7
for num in ${nums[0]}
do
  if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
  then
    echo $num
  fi
done



#check for Hawaii in states
for state in ${states[0]}
do
  if [ $state == 'Hawaii' ]
  then
    echo "Hawaii is the best!"
  else
    echo "I'm not a fan of Hawaii."
  fi
done

#create a loop that print each item in variable holding output of ls command
for x in ${ls_out[0]}
do
  echo $x
done


#Bonus
#Create a for loop to print out execs on one line for each entry
for exec in ${execs[0]}
do
  echo $exec
done

