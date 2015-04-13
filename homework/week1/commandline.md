# The Command Line Crash Course
## Introduction: Shut Up and Shell
You have to learn how to use the command line if you are going to be a programmer. You just have to.

So do it. Type without fear. Make your computer an extension of yourself.

## How to use this book
* Start at the beginning and do each exercise exactly as you are told.
* Use a small pad of paper and a pen.
* When you read something that doesn't make sense or that you don't understand, write it down! Leave space so that you can go back and answer.
* After you finish an exercise, go back through your notebook and review the questions you have. Try to answer them by researching online or reaching out to the instructors during office hours.

## Memorize This
* You have to memorize command line stuff, or else it really isn't so valuable.
* Make index cards.
* Drill index cards 15-30 minutes each day.
* Before you go to bed, drill the cards you got wrong for about 5 minutes, then go to sleep.

**Do NOT take command line advice from a random person on the Internet. Some hackers post misleading or harmful commands. Be wary.**

#Basic Commands
* **pwd** - print working directory
* **hostname** - my computer's network name
* **mkdir** - make directory
* **cd** - change directory
* **ls** - list directory
* **rmdir** - remove directory
* **pushd** - push directory
* **popd** - pop directory
* **cp** - copy a file or directory
* **mv** - move a file or directory
* **less** - page through a file
* **cat** - print the whole file
* **xargs** - execute arguments
* **find** - find files
* **grep** - find things inside files
* **man** - read a manual page
* **apropos** - find what man page is appropriate
* **env** - look at your environment
* **echo** - print some arguments
* **export** - export/set a new environment variable
* **exit** - exit the shell
* **sudo** - DANGER! become super user root DANGER!
* **chmod** - change permission modifiers
* **chown** - change ownership

##Paths, Folders, Directories, oh my (pwd)
Everyone's prompt might look different, especially on UNIX. But you'll probably have your user name before a "$" and then the name of your computer, or some variation on that theme.

**What is a directory?**
A directory is a folder. Folder and directory are the same thing, and they are used interchangeably. When you open the Finder on your computer to graphically find files, you are moving through folders, which are the exact same things as the directories you work with in the command line (Terminal).

* **pwd** prints the working directory (that is, the directory that you are currently using!)

##What? My name is hostname
Use 'hostname' to figure out the name of your computer...or at least one of it's names:
```
hostname
.local
```
##Make a directory (mkdir)
There are many different ways that you can run mkdir. What does mkdir do? Good question. It makes directories (aka folders). In the tutorial for this part we made a really long path of directories. A path is just a tree of folders that make up your computer's hard disk. Pretty straightforward...

##Change Directory (cd)
The **cd** command takes you to the file based on the path you enter directly after the command. So, for example:
`
$ cd bewd
$ pwd
/Users/davidzussman/bewd
`
cd 
