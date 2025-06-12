#!/bin/bash

clear

lastday=`date -d "Aug 1" +%j`
today=`date +%j`
days=$("$lastday" - "$today")

while true; do
  clear
  case "$days" in
    0)
      echo "Last Day!"
      ;;
    [0-9]*)
      echo ""$days" days remaining"
      ;;
    -[0-9]*)
      echo "Past Last Day!"
      ;;
  esac
  echo "Press [CTRL+C] to stop.."
  sleep "5"
done
