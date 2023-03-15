#!/bin/bash

# 	This script will do the following:

# Display the linux version

# Display the private IP address, public IP address, and default 
# gateway

# Display the hard disk size, free and used space

# Display the top 5 directories according to their size in the home 
# directory

# Display the CPU usage and refresh every 10 seconds


# References included in the comment section at the end of the script.


	echo 'Hello, welcome to Warren'\''s OS INFO script.'
	
# sleep function included to give user time to read information before 
# moving on.

sleep 2

	echo 'Running diagnostics, standby..'
	
# echo spacings to give script a cleaner look

	echo ' '

sleep 3

	echo 'Your current Linux version is:' 


uname -a

# uname function used to print system information
# -a flag used to give all necessary information about current OS 
# and versions

	echo ' '

sleep 3

	echo 'Your Private IP address is:'

ifconfig | grep broadcast | awk '{print $2}'

# ifconfig function used to find out Private IP address

# grep broadcast because that string is unique to the Private IP line

# awk '{print $N}' to specify string to print

sleep 2

	echo 'Your Public IP address is:'
	
curl ifconfig.io

# curl is used for transferring data from or to a server.
# In this case, ifconfig.io is used to find out Public IP address 


sleep 2

	echo 'Your Default Gateway is:'
	

route | grep default | awk '{print $2}'

# route is used to display the default gateway

# Used grep and awk to pinpoint default gateway and give output a 
# cleaner look

	echo ' '

sleep 3

	echo 'Calculating disk size and space available..'

sleep 3

df -h --output=source,size,used,avail | sort -h -k 4


# df function reports file system space usage
# -h prints sizes in powers of 1024 
# (i.e. gigabyte, megabytes, and kilobytes)
# --output flag used to give concise information on size, 
# used disk space, and available disk space

#sort -k specifies the column to sort in this case it is being sorted in
# descending order in terms of available space

	echo ' '

sleep 3
	
	echo 'These are the top five directories according to their size: '
	
du -h --max-depth=1 | sort -hr | head -n 5

# du gives an estimate breakdown of file space usage
# -h prints output in human readable format (similar to df -h) 
#--max-depth prints the total for a directory only if it is N or fewer
# levels below the command line argument 
# N set to 1 for easier readibility and simplicity

# sort function to sort lines of text files 
# -h compares human readable numbers (e.g., 2K 1G) 
# -r reverses the result of the comparison to arrange the top 5 directories 

# head outputs the first part of files
# -n prints the first number of lines instead of the first 10

	echo ' '

sleep 3

	echo 'Your current CPU usage is (timer has been set to refresh every 10 seconds): '
	
	echo ' '
	
	echo 'Press '/'Q'/' to end script'

top -id 10

# top displays a dynamic real-time view of a running system. 
# -i ignores idle processes
# -d flag specifies the delay time in seconds for refreshing the data 



#REFERENCES

#~ sleep: https://www.youtube.com/watch?v=7qd5sqazD7k&ab_channel=NetworkChuck

#~ uname: https://linuxize.com/post/uname-command-in-linux/

#~ ifconfig | grep | awk | sort | curl: https://www.notion.so/cfcapac/Linux-Fundamentals-XE-Basics-201f31ca6f854e9e962419dc9f18517d

#~ df: https://www.linuxfoundation.org/blog/blog/classic-sysadmin-how-to-check-disk-space-on-linux-from-the-command-line#:~:text=That%20command%20is%20df%20%2DH,your%20system%20(Figure%201).

#~ du: https://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/

#~ top: https://www.technewstoday.com/how-to-check-cpu-usage/


	
