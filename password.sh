#!/bin/bash  #Bash hell login
     echo "enter the password"
read password
len="${#password}"

if test $len -ge 10 ; then  #password length

     echo "$password" | grep -q [0-9]

if test $? -eq 0 ; then

     echo "$password" | grep -q [A-Z]

if test $? -eq 0 ; then

     echo "$password" | grep -q [a-z]

if test $? -eq 0 ; then

     echo "$(tput setaf 2)This is an awesome password!"  #setaf2 is green

   else

     echo "$(tput setaf 1)weak password include lower case char" #setaf1 is red 

fi
 
   else

     echo "$(tput setaf 1)weak password include capital char"

fi

   else

      echo "$(tput setaf 1)please include the numbers in password it is weak password"
fi

    else

      echo "$(tput setaf 1)password length should be greater than or equal 10 hence weak password"

fi

