   # **Table of contents**
 --------------------------
 1. Overview about the code
 2. Prerequistes
 3. Step by step instructions to do the backup
 ----------------------------------------------
 
 ## **1. Overview about the code:**
    -------------------------------
   A program to automatically backup a directory every time it is modified. It only keeps the last n backup directories as specified by the user. 
   Folder hierarchy:
    	1. lab2
    		1. backup
	    		1. srcdir
	    		2. backupdir
	    			(contains maximum of n folders of backups adjustable according to the user)

   
 ## **2. Prerequistes:**
     --------------------
    2.1 To run the code, make sure to install the Make package.
	 To install the make package:
	  1. Open the terminal on your Ubuntu Linux.
	  2. Write "sudo apt install make".
	  3. Wait for the installation to finish.
    2.2 Make sure the source directory and backup directory are in the same folder.
	  
    
  ## **3. Step by step instructions to do the backup:**
     ---------------------------------------------------
     1. Open Makefile.
     2. Change the specifications written beside the script name "/home/mariem/lab2/backup/backupd.sh" according to what you wish for in this order (source directory, destination directory, interval -secs-, maximum number of backups) leaving space between every specification.
     3. Make sure to change every "backupdir" in Makefile to the backup directory name you want.
     4. Open the terminal on your Ubuntu and type "cd backup".
     5. Type "make" then press enter.
     6. The program will run.
     7. To terminate the program press ctrl + c
     
     
