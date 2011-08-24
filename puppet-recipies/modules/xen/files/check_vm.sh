#!/bin/bash 

check_stop=`xe vm-list power-state=halted | grep name-label | grep -v -i .stop`
if [ "$check_stop" -lt "1" ];then
	xe vm-list power-state=running | grep running > /tmp/vmlist 
	COUNT=`wc -l < /tmp/vmlist` 
		if [ "$COUNT" -lt "1" ] 
		  then 
		    echo "ScriptRes:VM DOWN:"$COUNT 
		  else 
		    echo "ScriptRes:OK:"$COUNT 
		fi
fi
