# learn-unix a Docker Version of the UNIX Learn CBT package

Learn is a Computer-Based Teaching tool that gives basic training
in using UNIX and Linux.
It was written in the nineteen
seventies by Mike Lesk of AT&T Bell Laboratories with some
contributions from Brian Kernighan.

Learn teaches basic UNIX commands.  It does so by driving the student
through a series of lessons each of which involves using commands
to achieve some goal, such as creating a file with a specified
contents.
When the student announces that she has finished the lesson,
the software checks the result,
marks the lesson and moves on to the next one.

Although the result looks a little antiquated to some,
learn has proved to be extremely valuable
because it teaches the student by getting her to use real UNIX
commands on a real UNIX system.

Learn offers a number of courses, including Files and More Files.
With good progress,image
it should be possible to get through both of those in one day,
but it would probably be better done
in a series of short sessions.

The files and More Files courses are the most useful.
The others cover software that has mostly fallen out of use.
For example, the course on editing files
explains how to use a command line editor.

The learn software was aimed at an American audience,
colleagues at Bell labs in the nineteen seventies.
Some of the lessons contain a cultural bias as a result.
One of them requires a knowledge of baseball stars ofthe day.
I suspect that many Americans might have difficulty answering that one today.

Another lesson asks about "an unsuccessful English king".
The answer is George III,
who was king when England lost the American colony.
That may make sense to an American,
but over here in the UK we remember George for being mad, not unsuccessful.
In other countries,
people probably don't remember him at all,
so that question will cause problems for some people.

A more serious problem with learn is that occasionally it can produces a problem
that can't be answered -
for example, it may ask you to find a file that it failed to set up.
If you can't make sense of a lesson,
skip it and move on to the next one.
Nobody's watching you.

You can run learn on any laptop or desktop computer -
a Windows PC, a Mac or whatever.
(I don't think it will run on a tablet.)
You need to install two pieces of support software, but apart from that,
the sequence is similar whatever you use.
Since most people use Windows,
I will show how to run it in that environment.

You need to install docker.
Under Windows 10,
do that as described [here](https://runnable.com/docker/install-docker-on-windows-10).

Install [git for windows](https://git-for-windows.github.io/).

Go to your start menu and run Git Bash. That starts a command window.

In a command window, you see a prompt of some sort.
Type a command and press the Enter key.
The command runs.
When it finishes,
you get another prompt.

Type these commands in your command window.
Press the enter key to run the command and
wait for it to finish before you type the next one:

    git clone https://github.com/goblimey/learn-unix
    
    cd learn-unix
    
    docker build .

That last command will take a few minutes.
It will produce output showing what it's doing.
If all goes well, the last line should be something like:

    Successfully built 68b1841290ef
    
which means that it's built a docker image with ID 68b1841290ef.
You get a different image ID each time you run this command.
(You should only have to run it once.)

Run the image like so:

    docker run -it --entrypoint=/bin/bash 6b9a7da1af64

which produces a prompt like this:

    learner@79c33cdc14ac:/learn$
    
The Docker is running the image and a user called "learner" is logged in.
The system is prompting for a command.  Run this command:

    learn files

and you will see this:

    If you were in the middle of this subject
    and want to start where you left off, type
    the last lesson number the computer printed.
    To start at the beginning, just hit return.
   
Press the Return key (which is sometimes labelled Enter)
and the first lesson will begin.

You can leave the command window running learn and do the lessons at your own speed.
If you break off, 
when you come back,
it will be just as you left it.

If you want to give up at any point,
note the number of the last lesson you completed
and shut the learn system down.
To do that, at the end of a lesson,
hold down the CTRL key and type a single d (no return key needed).
That sequence is often written ctrl/d.

The learn command exits and you get the same prompt that you got at the start:

    learner@79c33cdc14ac:/learn$

Type another ctrl/d and your docker session finishes.
You can close your git bash window.

When you stop the docker container,
all the files that you created in it are tidied away.
Unfortunately, learn also forgets how far you got.
That's why you need to keep a note of your last lesson number.
If you supply that,
learn continues from that point.

Once you've finished the Files course,
do the More Files course. 

It will take a few hours to do both courses.
As I said,
do them at your own speed.

If you don't end the docker session tidily by typing ctrl/d twice,
it will continue to run in the background,
using up computer memory.
You can end the session forcibly.
Start another git bash window and do this:

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
but the software that they teach about is of limited use to most users these days.

The Editor course covers regular expressions,
which are useful,
but the editor it describes is an ancient command-driven tool.
You will probably do better by typing "regular expressions" into Google.

The first lesson in the Macros course begins
"WARNING: This course was written for UNIX in 1979, not 1999,
and has not yet been updated. Some details may be way out of date!"

Twenty years on, that's not a good sign.
In fact the macros involved could be useful,
but only to people who wish to create and update UNIX man pages.

The Eqn course covers a typesetting tool that is still used,
but the subject is somewhat of a niche.

## A brief History of Learn
The learn software was originally included in version 7 UNIX
which was released in 1978.
I and many other people used it in the eighties to learn the basics of UNIX.
Since then I've made my living using these skills.

The software and the lessons were not reworked as UNIX developed and they
became increasingly out of date. Versions of UNIX were released that
didn't contain the software, and it was largely forgotten.  However,
the material was preserved by the OpenBSD group.

The learn software is written in the C programming language.
That language also evolved,
but the learn software was not reworked to match.
Eventually it became impossible even to build and run it.

One reason for learn falling out of use is that through the nineteen nineties
the emphasis shifted from systems driven by a command line interface
to systems driven by windows and a mouse.
Microsoft produced its Windows system
and UNIX systems were fitted with a similar style of interface
using X-Windows.
Software that taught the use of a redundant style of interface
was not wanted on voyage.

In 2002 I reworked the learn source code
so that it would compile and run,
and bought it under the control of the standard GNU
software configuration tools.
That whole
exercise took less than a week, which makes the original loss of
the software a great pity.

At the time this work did not
gain traction,
partly because of chicken and egg problems.
Learn is
aimed at people who do not know much about UNIX, but they needed to
know a certain amount to install and run it.
Also, they needed access to a computer running UNIX.
That could be done by installing Linux on an old Windows machine,
but that involved knowing some UNIX commands ...

More recently,
command line interfaces systems have returned
in the form of the Virtual Private Server (VPS)
and cloud computing.
One very large computer run by an Internet Service Provider
provides a large number of simulated computers
which are rented by its customers.
These are very cheap and
they can be set up and torn down to order using software such as Kubernetes.
It's very common for virtual servers to run Linux
and for them to be controlled via a UNIX command-line interface.
Thus a generation of IT specialists with a background in
windows-driven environments
now have to get their heads around the command line interface,
and the learn software becomes valuable again.

Another recent development is the emergence of
very cheap single-board computers such as the Raspberry Pi.
These run versions of Luinux such as Raspbian,
so UNIX is becoming a mass-market product.

It's also worth mentioning that Apple's Mac range of computers
run UNIX.
It's heavily disguised behind a nice windows-style interface,
but for some uses you need to run a command window and drive it
by typing UNIX commands.

In 2019 I solved the chicken and egg problems by reworking the software
to run under Docker.
Now learn can be built and run in a Microsoft Windows environment
and the process is straightforward.
So it's now feasible to use the computer that you already have
to learn basic UNIX commands.

The learn software and the courses are copyright AT&T, but a note
in the source code gives permission for fairly free use.  For the
precise conditions, see the file LICENSE or any of the C source files.


## Use in Schools and Colleges

The docker version is mainly intended for a machine running
Microsoft Windows, as that is the most common environment available.
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