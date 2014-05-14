#!/bin/bash

awk -F\" '
  $1 ~ /^#/ {  next } 
  /_HOST/  {
# 		  print
		  itc=split($1,outa,"_");

		  if (itc > 2)
		    {
		     host=outa[1]"_"outa[2];
                    } 
		  else
		    {
		     host=outa[1];
                    } 



		  allHosts[host]=allHosts[host]+1;
 
		  next
		} 

  { next }

  END { 
	cnt = 0
	dupcnt = 0
	for (item in allHosts)
	{
           cnt = cnt + 1
	   if (allHosts[item] > 1)
	   {
 	     printf "WARNING: host %s has duplicates.\n", item
	     dupcnt = dupcnt + 1;
           }
        }

        if (dupcnt > 0)
         {
	   print "There are "dupcnt" duplicates."
         }
	else
         {
	   print "There are no duplicates."
         }
	print "Total hosts found : "cnt;
     }
	
' $*
