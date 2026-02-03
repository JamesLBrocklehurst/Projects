### Bash Scripting 

#### The 'Shebang' Line
The `Shebang` Line starts with a # followed by a ! this interprets the shell so the system knows how to handle the script.
Should be placed as the first line on a script. 


#### Comments
Single line comments for example `# Prints greeting to the console` are anything that has a # followed by a space.

For multi-line comment this is slightly different, you must firstly do `: '`. Then anything entered on lines underneath will be classed as a comment until you add a `'` on the final line to close off your comments.

For example:

:'

This is a multi-line comment.

Which would show as the such if you were to preview the bash script.

'

#### Running a script from anywhere

Use the $PATH command to find directories: separated by :'s to see environment variables.

You need to move a script to an environment variable in order to run the script from wherever on a system.

An example local and commonly used for scripts is `/usr/local/bin`.

In order to move the file to this location, example file here is *greet.sh* use the command `sudo mv greet.sh /usr/local/bin/greet` in this command I changed the name of the file to drop the .sh from the end. sudo is required at the beginning as you need elevated permissions to move files into a `PATH` location.

In my command I renamed the file from greet.sh > greet this was to make the file easier to run.

You may also need to check that the file is still executable. If not, run the command `sudo chmod +x /usr/local/bin/greet`.

You should then be able to type *greet* and hit enter from any location and this will run the file/script.

#### Variables

A variable is something that can be called once set. An example of this is saying `greeting="Hello World!"`, in the script to call this value you would simply need to input `echo $greeting` When the script is then run it would print the output *Hello World!*.

#### Parameters

A parameter within a script makes it so you can pass a value in your command and this will print in the output.

Example Script:

```bash
#!/bin/bash

echo "Parameter 1: $1"
echo "Parameter 2: $2"
echo "Parameter 3: $3"


echo "All Parameters: $@"
```
The command may be something along the lines of ./(script/filename) hey hi hello. From this you would get the output: 

```
Parameter 1: hey
Parameter 2: hi
Parameter 3: hello
```

The special value in the end line `echo "All Parameters: $@" prints all lines together in this instance your output would show as the below:

```
➜  ~ ./(script/filename).sh hey hi hello
Parameter 1: hey
Parameter 2: hi
Parameter 3: hello
All Parameters: hey hi hello
```

#### if Statements

A if Statement: in bash starts with a `if` command and ends in a `fi`.

if Statements are formed using comparsion operators:

eq = equals
ne = not equal to
lt = less than
gt = great thans
le = less than or equal to
ge = greathen than or equal to

String comparison:

== - equals
!= - not equal to

`elif` used to handle more than one condition. If the `elif` clause is also not met then it results to `else`.

##### Nested if Statements

Allows you to embed `if Statements` within another *if Statement*

#### Loops % Flow Control

while loops allow you to repeatable run a block of code, while a condition remains true.

``` bash
#!/bin/bash

while condition
do
    # Code to be executed
done
```
for Loops

```bash
#!/bin/bash

for variable in sequence 
do
    # Code block to be executed
done
```
break and continue

 - break:

```bash 
#!/bin/bash

for (( i=1; i<=5; i++ ))
do
    if [ $i -eq 3 ]
    then
        break
    fi
    echo "number: $i"
done
```
- continue:

```bash
#!/bin/bash

for (( i=1; i<=5; i++ ))
do
    if [ $i -eq 3 ]
    then
        continue
    fi
    echo "number: $i"
done
```

#### Bascis and Functions

``` bash
#!/bin/bash

function_name () {


    # code block to be executed

}

```
Parameters


*2 different types of parameters*

`Positional parameters` 

`Special parameters`

User Inputs

Always scripts to interact with users to make them more dynamic and responsive.

Piping

```bash
#!/bin/bash

get_file_count (){
    local directory="$1"
    local file_count

    file_count=$(ls "directory" | wc -l)
    echo "Number of files in $directory"
}
```

### Error handling

For seeing where things can go wrong and handling rather than letting the script crash.

```bash
#!/bin/bash

num1=10
num2=0

if [ $num2 -eq 0 ]; then
    echo "Error: Divison by zero is not allowed."
    exit 1
fi

result=$((num1 / num2)) 

echo "The results is: $result"
```
#### Exit codes

0 = complete/success
1 = error

```linux
echo $?
```
^ shows the exit code of the last completed command

#### Environemnt and Paths

```linux
➜  Projects mkdir my_scripts
➜  Projects ls
Bash  Linux  my_scripts
➜  Projects cd my_scripts
➜  my_scripts vi hello_world.sh
➜  my_scripts chmod +x hello_world.sh
➜  my_scripts ls
hello_world.sh
➜  my_scripts ls -l
total 0
-rwxrwxrwx 1 jamesbrock jamesbrock 32 Jan 29 21:03 hello_world.sh
➜  my_scripts echo "export PATH=$PATH:~/my_scripts" >> ~/.zshrc                                                                                                                                                                                                                         
➜  my_scripts source ~/.zshrc                                                                                                                                                                                                                                                                                                            
/home/jamesbrock/.zshrc:213: no matches found: (x86)/NVIDIA
# This is ran against a Windows device using the `wsl` command line hence why it could not find the location.
```
#### Working with files

`Look at the file-operators.sh file`