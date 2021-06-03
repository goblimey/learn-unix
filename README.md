# The UNIX Learn CBT package Running Under Docker

Learn is a Computer-Based Teaching tool that gives basic training
in using UNIX and Linux.
It was written in the nineteen seventies
at AT&T Bell Laboratories by Mike Lesk 
with some contributions from Brian Kernighan.

Learn teaches basic UNIX commands.  It does so by driving you
through a series of lessons each of which involves using commands
to achieve some goal, such as creating a file with a specified
contents.
When you announce that you have finished the lesson,
the software checks the result,
marks the lesson and moves on to the next one.

Although the result looks a little antiquated to some,
learn has proved to be extremely valuable
because it works by getting you to use real UNIX
commands on a real UNIX system.

Learn offers a number of courses,
the most useful being Files and More Files.
With good progress,
it should be possible to get through both of those in one day,
but it would probably be better done
in a series of short sessions.

The learn software was aimed at an American audience,
specifically colleagues at Bell labs in the nineteen seventies.
Some of the lessons contain a cultural bias as a result.
One requires a knowledge of baseball stars of the day.
Being a Brit,
I didn't have a clue what the answer was when I used learn back in the 1980s.
I suspect that many Americans would have difficulty answering that one today.

Another lesson asks about "an unsuccessful English king".
The answer is George the Third,
who was king when England lost the American colony.
That may make sense to an American,
but over here in the UK we remember George for being mad, not unsuccessful.
In other countries,
people probably don't remember him at all,
so that question will cause problems for some people.

A more serious problem with learn is that
occasionally it can produces an impossible task.
For example, it may ask you to find a file that it failed to set up.

If you can't make sense of a lesson,
skip it and move on to the next one.
Nobody's watching you.

You can run learn on any laptop or desktop computer -
a Windows PC, a Mac or whatever.
I don't think it will run on a tablet.

You may need to install some support software first, 
and the way you do that is different on each system.
Once you've done that,
the process is the same everywhere.

## Installation
You need to install git and Docker.
On a Mac or a Cloud server, that's fairly easy,
on a Winows machine it can be harder,
in fact it may be the most difficult part of the whole exercise.
However, Docker is very useful for other purposes,
so it's worth the effort.

Amazon EC2 Instance:

[installing git](https://cloudaffaire.com/how-to-install-git-in-aws-ec2-instance/)

[installing docker](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html)

Digital Ocean Droplet:

[installing git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04)

[installing docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

Mac:

[insatalling git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

[installing docker](https://docs.docker.com/docker-for-mac/install/)

To use Docker on a MAC, you also need to know how to start a command window.
That's described [here](https://support.apple.com/en-gb/guide/terminal/apd5265185d-f365-44cb-8b09-71a064a42125/mac)

### Installing Docker on a Windows Machine

If you're using Windows 10 Pro or Windows Enterprise,
Follow
[these instructions](https://runnable.com/docker/install-docker-on-windows-10).

If you're using Windows 10 home,
installing docker is a bit more difficult.
First, you need to enter your computer's BIOS and enable virtualization.
Doing that is is explained
[here](https://www.laptopmag.com/articles/access-bios-windows-10).

That document explains how to make all sorts of BIOS changes,
but you just need to switch on virtualisation.
When I did it,
I found that the route through the Windows menus is now a bit different
and so is the route through the BIOS on my machine.
The virtualization option was in a different menu and it had a different name.
The process is a bit complicated and
once you are in the BIOS, you can't read web pages,
so if you don't have another computer handy,
you have to note down what to do before you start.

Once you've enabled virtualization
you need to download the docker toolbox.
That's described [here](https://medium.com/@mbyfieldcameron/docker-on-windows-10-home-edition-c186c538dff3).

I followed that writer's advice and installed Linux into Virtual Box.
There are many flavours of Linux, and I chose Ubuntu.
Whichever one you use,
you need the latest supported version of the desktop installation.

Installing Linux into Virtual Box takes a long time
and it asks you to make lots of decisions,
but apart from your locale and timezone,
you can just take the default option each time.
I got the installation wrong the first time,
but I just threw that one away and created another. 

Once you've installed Linux,
start it up and log in using the user name and password that you created
during the installation.
Once you see a Linux desktop,
start a terminal running.
How you do that depends on the flavour of Linux.
You will have to look around the icons on the desktop.
Once you have a terminal window running,
expand it to full screen.

It's usually possible to paste text from other windows
into your Linux terminal window,
but so far I haven't figured out how to that with Virtual Box.
If you can copy and paste, that's handy
because some of the commands shown below are quite long.
The usual Windows shortcuts ctrl/c and ctrl/v do not work
in a command window.
Ctrl/c aborts the current command, so avoid typing that
unless you mean to.

In your command window, you see a prompt of some sort.
Type a command and press the Enter key.
The command runs.
When it finishes,
you get another prompt.

Run these commands one by one,
waiting for each to finish before running the next:

    git clone https://github.com/goblimey/learn-unix
    
    cd learn-unix
    
    docker build . -t learnunix
    
That last command will take a few minutes.
It will produce output showing what it's doing.
If all goes well, the last two lines should be something like:

    Successfully built 68b1841290ef
    Successfully tagged learnunix:latest
    
The first of those lines means that docker has built an image with ID 68b1841290ef.
You get a different image ID each time you run this command.
(You should only have to run it once.)

The second line says that the image is tagged with the name "learnunix".
You can refer to it by this name rather than the image name.

Run the image like so:

    docker run -it --entrypoint=/bin/bash learnunix

which starts the docker image running within a container
and produces a prompt something like this:

    learner@79c33cdc14ac:/learn$
    
Within the Docker session a user called "learner" is logged in.
You will use that user to run learn.
The system is prompting for a command.  Run this command:

    learn files

and you will see this:

    If you were in the middle of this subject
    and want to start where you left off, type
    the last lesson number the computer printed.
    To start at the beginning, just hit return.
   
Press the Return key (which is sometimes labelled Enter)
and the first lesson will begin.

You can leave the command window running learn
and do the lessons at your own speed.

If you want to give up at any point,
note the number of the last lesson you completed
and shut the learn system down.
To do that, at the end of a lesson,
hold down the CTRL key and type a single d (no return key needed).
That sequence is often written ctrl/d.
The learn command exits and you can type more commands
into your your command window.

Learn expects that various commands are available in the environment you are using:
ls, cat, date, spell and so on.
I've tried to make sure that they are all present.

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
As I said,
do them at your own speed.

If you don't end the docker session tidily by typing ctrl/d,
it will continue to run in the background,
using up computer memory.
You can end the session forcibly
if you know its container ID.
To find that out,
start another git bash window and do this:

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

Twenty years on, that's not a good sign.
Actually the macros involved could be useful,
but only to people who wish to create and update UNIX man pages.

The Eqn course covers a typesetting tool that is still used,
but the subject is somewhat of a niche.

## Fun With Docker
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

The learn software is written in the C programming language.
That language also evolved and
eventually it became impossible even to build and run learn.

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
partly because of chicken and egg problems.
Learn is
aimed at people who don't know much about UNIX,
but they need to
know a certain amount to install and run it.
Also, they need access to a computer running UNIX.
That could be done by installing Linux on an old Windows machine,
but that involved knowing some UNIX commands ...

Nowadays
command line interfaces are back.
We are all using Virtual Private Server (VPS) systems
and cloud computing.
Virtual servers are very cheap and
they can be set up and torn down to order using software such as Kubernetes,
with the application software running under Docker.
Most virtual servers run Linux
and you control them by
logging in via a command-line interface.

Apple's Mac range of computers
run UNIX.
It's heavily disguised behind a nice windows-style interface,
but for some purposes you need to start a command window and
type UNIX commands.

A more recent development is the emergence of
very cheap single-board computers running Linux, such as the Raspberry Pi.

All this makes UNIX a mass-market product
and
a generation of IT specialists with a background in
windows-driven environments
now have to get their heads around the UNIX command line interface.
So the learn software becomes valuable again.


In 2019 I made learn much easier to use by reworking it
to run under Docker.
Now you can build and install it in a Microsoft Windows environment
using a simple process.
(The process is a bit long,
but you just have to do all the steps one by one.
you no longer need to understand lots of new stuff before you even start.)
So it's now feasible to use the computer that you already have
to learn basic UNIX commands.

The learn software and the courses are copyright AT&T, but a note
in the source code gives permission for fairly free use.  For the
precise conditions, see the file LICENSE or any of the C source files.


## Use in Schools and Colleges

The docker version is mainly intended for a machine running
Microsoft Windows, as that's the most common environment available.
Without docker, you would have serious difficulties getting learn to run
there.

If you have your own network of UNIX machines, you can clone the github
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
When running the docker image, type "man learn" to read it.

A paper by Lesk in volume 2 of the version 7 UNIX manual
explains how to write new lessons.  Now over forty years old, the
software looks clunky compared to modern CBT systems, but
it runs under UNIX, it's implemented using UNIX, and when using it,
the student is driven through using UNIX commands to achieve the results.
This makes it a good medium for writing courses about UNIX.

As Lesk explains in his paper, the main hurdle is to get the user started.
To run learn, she has to understand how to type commands.
This is the first thing that learn teaches, could she
figure out how to run it ...

I hope that you find learn as valuable as I did all those years ago.

Simon Ritchie ([goblimey.com](http://goblimey.com))
