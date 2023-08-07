# The UNIX Learn CBT package Running Under Docker

Learn is a Computer-Based Teaching tool that gives basic training
in using UNIX and Linux.
It was written in the nineteen seventies
at AT&T Bell Laboratories by Mike Lesk 
with some contributions from Brian Kernighan.

This version of the tool runs under Docker, which 
allows it to to run on a Windows system
makes it easier to install
on all systems.
Docker can run on
a Windows PC, a Mac, a cloud server or whatever.
(I don't think it will run on a phone or a tablet.)

Learn teaches basic UNIX commands.  It does so by driving you
through a series of lessons each of which involves using commands
to achieve some goal, such as creating a file with a specified
contents.
When you announce that you have finished the lesson,
the software checks the result,
marks the lesson and moves on to the next one.

Although the result looks a little antiquated,
learn has proved to be extremely valuable
because it works by getting you to use real UNIX
commands on a real UNIX system.


## Installation

Whichever system you use to run the learn tool,
it needs to run
git and docker. 
The installation process for those is different on each system.
Once you've installed them,
the process of building and running the learn tool itself
is the same everywhere.

Docker runs under Windows 11 Home,
recent versions of Windows 10 Home
and under Windows Pro.
To install it on Windows Home systems
you also need
to install the Windows Subsystem for Linux version 2
(WSL2).

A Digital Ocean Droplet or an Amazon EC2 instance
both provide a cloud server on which you can
run Docker and therefore the learn tool.
You need to control a cloud server from a local machine
such as a laptop computer.
If that's running Windows,
you need to install git bash on it as shown below.

### Windows Home

[installing git](https://git-scm.com/download/win/)

Install WSL2 as described [here](https://learn.microsoft.com/en-us/windows/wsl/install/).
That needs you to run a DOS command window in admin mode:
type "cmd" into the search box at the bottom of the screen,
right click on the black icon that appears
and choose "run as adminstrator".
That starts the command window.
Select it,
type "wsl --install" into it (without the quotes)
and press the enter key to run the command.

[installing docker](https://docs.docker.com/desktop/install/windows-install/)



### Apple Mac

[installing git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

[installing docker](https://docs.docker.com/docker-for-mac/install/)

If you're using a MAC you also need to know how to start a command window.
That's described [here](https://support.apple.com/en-gb/guide/terminal/apd5265185d-f365-44cb-8b09-71a064a42125/mac)


### Digital Ocean Droplet

[installing git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04)

[installing docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)


### Amazon EC2 Instance

[installing git](https://cloudaffaire.com/how-to-install-git-in-aws-ec2-instance/)

[installing docker](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html)



## Building Learn

### Windows

Under windows you need two command windows,
the DOS command window that you used earlier to install WSL2,
plus a git bash window.

In your command window, you see a prompt of some sort.
Type a command and press the Enter key.
The command runs.
When it finishes,
you get another prompt.

Run the commands one by one.
Wait for each to finish before running the next.

Run this commands in your git bash window:

    git clone https://github.com/goblimey/learn-unix

That creates a directory called learn-unix containing a copy
of this repository.

In your DOS command window, change to that directory
and build the docker image like so:
    
    cd learn-unix
    docker build -t learnunix .

(Note the "." at the end of the line.)
    
That last command will take a few minutes.
It will produce output showing what it's doing.
If all goes well, the last two lines should be something like:

    Successfully built 68b1841290ef
    Successfully tagged learnunix:latest
    
The first of those lines means that docker has built an image with ID 68b1841290ef.
You get a different image ID each time you run docker build.
(You should only have to run it once.)

The second line says that the image is tagged with the name "learnunix".
You can refer to it by this name rather than the image name.

### All Other Systems

Once you've installed git and docker,
you need to start a command window
and run these commands:

    git clone https://github.com/goblimey/learn-unix
    
    cd learn-unix
    
    docker build -t learnunix .

(Note the "." at the end of the line.)
    
That last command will take a few minutes.
It will produce output showing what it's doing.
If all goes well, the last two lines should be something like:

    Successfully built 68b1841290ef
    Successfully tagged learnunix:latest
    
The first of those lines means that docker has built an image with ID 68b1841290ef.
You should only have to build the image once.
If you run the build command again,
you will get another image with a different ID.

The second line says that the image is tagged with the name "learnunix".
You can refer to it by this name rather than the image name.

## Running Learn 

On any system, run the Docker image in a command window like so:

    docker run -it --entrypoint=/bin/bash learnunix

(Under Windows, use a DOS command window to do that.)

That starts the image running within a container
and produces a prompt something like this:

    learner@79c33cdc14ac:/learn$
    
The docker session is running a version of Linux 
within whatever operating system your computer uses.
You are logged into it as a user called "learner".
You will use that user to run learn.
The system is prompting for a command.  Run this command:

    learn files

and you will see this:

    If you were in the middle of this subject
    and want to start where you left off, type
    the last lesson number the computer printed.
    To start at the beginning, just hit return.
   
Press the Enter key
and the first lesson will begin.

You can leave the command window running learn
and do the lessons at your own speed.

Learn offers a number of courses,
the most useful being Files and More Files.
With good progress,
it should be possible to get through both of those in one day,
but it would probably be better done
in a series of short sessions.

The learn software was aimed at an American audience,
specifically colleagues at Bell labs in the nineteen seventies.
Some of the lessons are biased to that culture.
One requires a knowledge of baseball stars of the day.
Being a Brit,
I didn't have a clue what the answer was when I used learn back in the 1980s.
I suspect that many Americans would have difficulty answering that one today.
Use Google to find the answer or skip the question - nobody's watching you.

Another lesson asks about "an unsuccessful English king".
The answer is George the Third,
who was King when England lost the American colony.
That may make sense to an American,
but over here in the UK we remember George the Third
for being mad, not unsuccessful.
In other countries,
people probably don't remember him at all,
so that question would cause problems for some people.

A more serious problem with learn is that
some lessons depend on material created in an earlier lesson
and for various reasons, that may not have run. 
So occasionally learn might produce an impossible task.
For example, it may ask you to find a file that's
not been set up.

If you can't make sense of a lesson,
skip it and move on to the next one.

## Shutting Down

If you want to pause
and come back later,
note the number of the last lesson you completed
and shut the learn system down.
To do that,
hold down the CTRL key and type a single d (no Enter key needed).
The learn command exits and you can type more commands
into your your command window.
If you type CTRL and d again
you will exit from the container,
it will die
and you will be back in your command
window on the host machine.
If you carry on typing commands
they run on the host machine.

Learn expects that various commands are available in the environment you are using:
ls, cat, date, spell and so on.
I've tried to make sure that they are all present.

One of the most important commands that learn covers is man,
the online manual.
Knowing about man allows you to learn about lots more commands.

When you end the docker session,
all the files that you created in it are tidied away.
Unfortunately, learn also forgets how far you got.
That's why you need to keep a note of your last lesson number.
When learn starts,
it invites you to give it a lesson number
and continues from that point.

Once you've finished the Files course,
do the More Files course.

It will take a few hours to do both courses.
Do them at your own speed.
If you don't end the docker session tidily by typing ctrl/d twice
it will continue to run in the background,
using up computer memory.
You can end the session forcibly
if you know its container ID.
To find that out,
start another command window and do this:

    sudo docker ps

That produces a list of running docker containers,
something like:
    
    CONTAINER ID  IMAGE        COMMAND                CREATED        STATUS       PORTS     NAMES
    a5666adfd5d5  68b1841290ef "/bin/sh -c /usr/loc…" 2 minutes ago  Up 2 minutes 2101/tcp  happy_bassi

So in this example, docker is running image 68b1841290ef in container ID a5666adfd5d5.
Stop that container like so, using its container ID:

    docker stop a5666adfd5d5


## Other Courses
Learn offers other courses,
apart from files and more files,
but the software that they teach about is of limited use to most users these days.

The Editor course covers regular expressions,
which are useful,
but the editor it describes is an ancient command-driven tool.
You will probably learn more by typing "regular expressions" into Google.

The first lesson in the Macros course begins
"WARNING: This course was written for UNIX in 1979, not 1999,
and has not yet been updated. Some details may be way out of date!"

Years later, that's not a good sign.
Actually the macros involved could be useful,
but only to people who wish to create and update UNIX man pages.

The Eqn course covers a typesetting tool that is still used,
but the subject is somewhat of a niche.

## GIT Bash

If you use Microsoft Windows you need to install git bash to install the learn tool.
Once you've complete the lessons,
you will find that they also work
if you type them into a git bash window
without running Docker.
The real purpose of git bash is to add a UNIX-style 
command line interface
to your Windows machine. 

(Pretty much the only command git bash doesn't provide is "learn".
You need to run the Docker container to get that.)

## Fun With Free Software

Docker is free for personal use,
but a large company may need to buy a licence to use it -
see the Docker website.

Now that you have Docker installed, there's a huge amount of useful software
out there that you can run for free.
The [Docker Hub](https://hub.docker.com)
contains thousands of ready-made Dockerfiles that you can use.
Each one downloads and builds a piece of free software.

To build and install the learn software, Docker does this:

    ./configure
    make install

That's a very common recipe for building free software.
So if what you want is available but not already on the Docker Hub,
you can download it,
create your own Dockerfile to build it,
then run it
on a Windows PC, a Mac, a Raspberry Pi,
an Amazon AWS server
or pretty much anywhere.
For example, see my reworked NTRIP caster
[here](https://github.com/goblimey/ntripcaster).
Never mind what one of those is,
the point is that the original is built and installed
in the same way as the learn software,
so the Dockerfiles for the two projects are very similar.

## A Brief History of Learn
The learn software was originally included in version 7 UNIX
which was released in 1978.
I and many others used it in the eighties to learn the basics of UNIX.
Since then I've made my living using those skills.

The software and the lessons were not reworked as UNIX developed and they
became increasingly out of date. Versions of UNIX were released that
didn't contain the learn software and it was largely forgotten.
However,
the material was preserved by the OpenBSD group.

The learn software was written in the C programming language.
That language also evolved and
eventually it became impossible even to build and run the learn software.

One reason for learn falling out of use is that through the nineteen nineties
the emphasis shifted from command line interfaces
to systems driven by windows and a mouse.
Microsoft Windows
became the desktop operating system of choice
for most people,
with the Apple Mac as a close second.
UNIX systems were fitted with their own Windows interface
so knowledge of the commands became less important.

In 2002 I reworked the learn source code
so that it would compile and run,
and bought it under the control of the standard GNU
software configuration tools.
That whole
exercise took less than a week, which makes the original loss of
the software a great pity.

At the time this work didn't
gain traction,
because of a chicken and egg problem.
Learn is
aimed at people who don't know much about UNIX,
but they needed to
know a certain amount to install and run it.
Also, they needed access to a computer running UNIX.
That could be done by installing Linux on an old Windows machine,
but that involved knowing some UNIX commands ...

In 2019 I fixed that problem by reworking the learn system
to run under Docker.
At the time
you could run Docker images on a Windows system
but it was a bit fiddly.
Now it's much easier,
so you can finally use learn to teach yourself about UNIX and Linux
before you invest in a real system.

That knowledge is useful because
command line interfaces are back.
We are all using Virtual Private Server (VPS) systems
(AKA cloud computers).
Virtual servers are very cheap and
they can be set up and torn down to order using software such as Kubernetes,
with the application software running under Docker.
Linux is free so
many virtual servers run it.
Once they are running they are controlled by
somebody connecting from a command window
and running commands on them.

Apple's Mac range of computers
have always run UNIX.
It's heavily disguised behind a nice windows-style interface,
but for some purposes you need to start a command window and
type UNIX commands.

A more recent development is the emergence of
very cheap single-board computers running Linux, such as the Raspberry Pi.

All this makes UNIX a mass-market product
and
a generation of IT specialists with a background in
windows-driven environments
have to get their heads around the UNIX command line interface.
So the learn software has become valuable again.

The learn software and the courses are copyright AT&T, but a note
in the source code gives permission for fairly free use.  For the
precise conditions, see the file LICENSE or any of the C source files.


## Use in Schools and Colleges

The docker version is mainly intended for a machine running
Microsoft Windows, as that's the most common environment available.
Without docker, you would have serious difficulties getting learn to run
there.

If you have your own Linux machines, you can clone the github
repository and install learn permanently like so:

    git clone https://github.com/goblimey/learn-unix
    
    cd learn-unix/learn
    
    ./configure
    
    make
    
    sudo make install
    
See the INSTALL file in the learn directory for more complex environments. 


## Layout of the material

There are three programs, learn, lcount and learn.tee.  Learn is the
front end and the user only needs to find that.

The lessons are text files.  They are stored in the lib directory
which contains a directory for each course.  Lesson 3.1a is in
the file L3.1a and so on.

The directory man contains the manual entry in nroff (man) format.
When running the docker image, type

    man learn

before you run learn command to read the manual entry for it.

A paper by Lesk in volume 2 of the version 7 UNIX manual
explains how to write new lessons.  Now over forty years old, the
software looks clunky compared to modern CBT systems, but
it runs under UNIX, it's implemented using UNIX, and when using it,
the student is driven through using UNIX commands to achieve the results.
This makes it a good medium for writing courses about UNIX.

(Having said that it looks clunky,
Google's ultra-modern
Go programming language is supported by a piece of training
software that's only slightly more sophisticated.)

As Lesk explains in his origina paper,
the main hurdle is to get the user started.
To run learn, the student has to understand how to type commands.
This is the first thing that learn teaches,
if only she could
figure out how to run it ...

I hope that you find the learn tool as valuable as I did all those years ago.

Simon Ritchie ([goblimey.com](http://goblimey.com))
