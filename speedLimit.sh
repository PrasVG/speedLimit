#!/bin/bash
variable=$1;
speedLimitVariable=$variable'KBytes/sec'
case $variable in
	off) sudo ipfw delete 1;echo "The Bandwidth fetters have been released."; ;;
	[a-zA-Z]) echo "Invalid parameter. Please enter a number."; ;;	
	*)      echo "Limiting the bandwidth speed to $speedLimitVariable."
		sudo ipfw pipe 1 config bw $speedLimitVariable && sudo ipfw add 1 pipe 1 src-port 80;;

esac

