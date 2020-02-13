#!/bin/bash

banner_color="\e[0;49;97m"
sub_banner_color="\e[5;49;92m[$]"
start_color="\e[2;49;97m"
end_color="\e[00m"

mapfile -t lines < <( cat /etc/passwd)
echo -e $sub_banner_color "cat /etc/passwd" $end_color
for line in "${lines[@]}"; do
  username=$(echo $line | cut -d ":" -f 1)
  echo -e $start_color"[*] Username - "$username $end_color
  userid=$(echo $line | cut -d ":" -f 3)
  echo -e $start_color"[*] User ID - "$userid $end_color
  groupid=$(echo $line | cut -d ":" -f 4)
  echo -e $start_color"[*] Group ID - "$groupid $end_color
  homedir=$(echo $line |  cut -d ":" -f 6)
  echo -e $start_color"[*] Home Directory - "$homedir $end_color
  shell=$(echo $line |  cut -d ":" -f 7)
  echo -e $start_color"[*] Shell - "$shell $end_color
done