### Bandit Level Passwords and Explanations

#### Connection ssh command:
`ssh bandit1@bandit.labs.overthewire.org -p 2220`
***"change the section before @bandit.labs.overthewire.org to bandit* * is what ever level number you are on"**

### 0-1 The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game.

Level 1 password - `ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If`

To get to this result run the command `ls` to confirm you are in the correct directory; confirm you can see the *readme* file

Run the command `cat readme` and this output the information within the readme file which should be the password to move onto the next level.

### 1-2 The password for the next level is stored in a file called - located in the home directory

Level 2 password - `263JGJPfgU6LtdEvgfWU1XP5yac29mFx`

As in the above level run the `ls` command to confirm that you are in the correct directory and can see the "-" file in the output.

In order to get the output to display the password/what is within the "-" file the command is slightly differnt from before. This is because Linux will expect another output when just inputting a hyphen.

In order to get the password from the file you can run either `cat ./-` or `cat > -` both commands essentially state that the file is called "-" so the terminal is not expecting another input.

### 2-3 The password for the next level is stored in a file called --spaces in this filename-- located in the home directory

Level 3 password - `MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx`

As with the above levels firstly run the `ls` command to confirm you are in the correct directory.

You then need to use either of these two commands `cat -- "--spaces in this filename--"` or `cat -- --spaces\ in\ this\ filename--`.

If you were to just use `cat -` this would not work as cat would interpret `-` as an option so in using `--` this nagates this issue.

To get around the spaces in the file name you need to either use the double quotation `""` one at the beginning of the file name and one at the end or using a `\` to show the space in the file.

### 3-4 The password for the next level is stored in a hidden file in the inhere directory.

Level 4 password - `2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ`

Again start by running the `ls` command this output will show that there is a sub directory called `inhere`. You need to move to that directory, to do this run `cd inhere` and run `ls` again to see what else might be hidden.

In this level running `ls` within the `inhere` directory will return nothing. This is because the file you want to access to obtain the password starts with `...` in order to see everything within a directory including files that may be hidden you need to run the `ls -a` command

From here you can open the text file `...Hidding-From-You` using the `cat` command and get the password to move on.

### 4-5 The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.

Level 5 password - `4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw`

Navigate to the correct directory. You will see there is multiple files with names similar to `-file00`. As mentioned before any command we do to try work out the level whilst accessing those files will need a `./` infront of the file name. This is down to the file name start with a `-`.

To work out which file has human readable data you need to know which file has text inside. To do this you need to use the `file` command. But as there is multiple files you do not want to go through them one at a time instead we want to wildcard. So the command we need to run to return all files and there file type information is `file ./*`. Once we know which file is the text file we then simple using the `cat` command to read that file.

### 5-6 The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable

Level 6 password - `HWasnPhtq9AVKe0dmk45nxy20cvUa6EG`

For this level we are going to use the find command since we have some specifics we are looking for. The command needed to find this file is `find inhere -type f -size 1033c`. How this works, `find inhere` searching through the everything within the *inhere* directory `-type f` sets the search to *regular files*, `-size 1033c` sets the search to return a only a file of that size.

### 6-7 The password for the next level is stored somewhere on the server and has all of the following properties:

owned by user bandit7
owned by group bandit6
33 bytes in size

Level 7 password - `morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj`

So similar to the above level we are looking for a file that could be anywhere within any directory. This time the only thing similar is we know the file is a specifc size. But we know the user owner and the group owner so we can also use those parameters. To find the password file on this level we are going to use `find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null`. 

So to run through this command we are using `/` as the directory as that is the base directory and we have no input as to which directory the file is within this time. We know the file needs to be readable so `-type f` is needed again, the user is bandit7 so we use `-user` and then the group is bandit6 so we also use `-group` both followed by the provided values. This is then followed up with `-size`. 

At the end of the command you can see `2>/dev/null` what this does is hide any permission-denied errors so that we can keep the output of the command clean. 

To get the password navigate to the directory from your output using the `cd` command and then read the file using the `cat` command. You could also put it all in one with `cat` the example would be `cat /some/path/secretfile`

### 7-8 The password for the next level is stored in the file data.txt next to the word millionth

Level 8 password - `dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc`

For this one we are looking for the password next to the word millionth in the file data.txt, so its simple they have given us the needed information. We just need to print the line where the word *millionth* is and we will get our password.

To do this use the command `grep millionth data.txt`. The command `grep` searches for text patterns inside files. So in this command we have said look for the word *millionth* inside the file *data.txt*

### 8-9 The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

Level 9 password - `4CKMh1JI91bUIZZPXDqGanal4xvAg0JM`

To get the password for this file we need to use two commands together `sort` and `uniq`. Because the data is all jumbled we first need to sort the data so that the `uniq` command works as we want it to. 

So in order for us to do this we need to use a `|`. The command should then look like this `sort data.txt | uniq -u` and the terminal output should be your password.

### 9-10 The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

Level 10 password - `FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey`

So for this one we can do two seperate things, either simple use the `strings data.txt` command which returns enough text to be able to scroll through to get the password. Or we can reduce the noise in the output by adding the `grep` command since we know the line also includes `=`.

So the full command would be `strings data.txt | grep '='`

### 10-11 The password for the next level is stored in the file data.txt, which contains base64 encoded data

Level 11 password - `dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr`

So we know that the password is within an encoded file, meaning we need to decode the file to be able to read the text and obtain the password.

For this we can use the `base64` command but also use the `man` command to find out what option will allow us to decode the file. In this case we need to run `base64 -d`. So in order to obtain the full password the complete command is `base64 -d data.txt`

### 11-12 The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

Level 12 password - `7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4`

The command to resolve and find the answer is `cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'`.

Whilst this looks confusing the command bascially says, read the data.txt file. For all capital and lower case letters in the alphabet move any letters in the range N-Z to A-M and vice versa.

### 12-13 The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory name. Or better, use the command “mktemp -d”. Then copy the datafile using cp, and rename it using mv (read the manpages!)

Level 13 password - `FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn`

### 13-14 The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Look at the commands that logged you into previous bandit levels, and find out how to use the key for this level.

Level 14 password - `MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS`

### 14-15 The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

Level 15 password - `8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo`

Connect to the level with the password. Use the netcar command *`nc`* and run the command `nc localhost 30000`. This opens a raw connection to port 30000. Paste in the password for level 14 and hit enter. This should then return the password for level 15. 

### 15-16 The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.

Level 16 password - `kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx`

For this level you are looking for a secure SSL connection. Becuase of this instead of use the `nc` command you are going to use `openssl s_client`. In this instance the command is `openssl s_client -connect localhost:30001`. You will recieve a load of output at the pause paste in the password for level 15, you should then get the output of the password for level 16.

### 16-17 The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

Level 17 password - `save as a private key on local device, connect the same was as level 14`

Use the nmap command to scan ports and see which are open and are going to need to be checked `nmap -p31000-32000 localhost`. From this output use the `openssl` command same as the last level to connect to each available port to find the correct port and get the password for the next level.

### 17-18 There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new

Level 18 password - `x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO`

Use the `diff` command with `grep` in order to get this password. Command to use is `diff passwords.old passwords.new | grep ">"`

### 18-19 The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.

Level 19 password - `cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8`

For this level you are unable to access the shell due to a modification to the **.bashrc** file. So in order to get the password you have to include your command to the connection string. `ssh -p 2220 bandit18@bandit.labs.overthewire.org cat readme`. Once ran enter the password and the output will give you the password to the next level.

### 19-20 To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

Level 20 password - `0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO`

`./bandit20-do cat /etc/bandit_pass/bandit20`

### 20-21 There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).



