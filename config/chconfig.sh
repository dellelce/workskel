#!/bin/bash

awk -F\" '
  $1 ~ /^#/ { print; next } 
  /_TRANSPORT/  {
 		  print
		  split($1,outa,"_");
#		  printf "%-20s %s\n", outa[1], $2

		  if ($2 == "telnet") ft="ftp";
		  if ($2 == "ssh") ft="sftp";
 
		  printf "%s_FILETRANSPORT=\"%s\"\n", outa[1], ft
		  next
		} 

  { print }
' $*
