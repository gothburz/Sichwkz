#!/bin/bash
if [[ "$#" -ne 1 ]]; then
    echo "Usage: ${args[0]} <file.txt>"
    exit 1
else
  for dir in $(ls -d */); do
    cd $dir
    for pcap in $(ls *.pcap); do
      printf $pcap
      printf "# $pcap #" >> $1
      tshark -r $pcap -Y "http.request.method==POST or http.request.method == GET" -T fields -e tcp.stream -e http.request.method -e http.request.full_uri -e http.file_data -E separator=/s >> "$1"
      printf "# END PCAP #" >> "$1"
      printf "\n\n" >> "$1"
    done
    cd ../
  done
fi
