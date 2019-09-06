Learn is a Computer-Based Teaching tool that gives basic training
in using UNIX (and Linux).  It was originally written in the nineteen
seventies by Mike Lesk of AT&T Bell Laboratories with some
contributions from Brian Kernighan.

The code may well run without change on other versions of UNIX, but
it's not yet been tested on anything but Linux.

The software and courses are copyright AT&T Bell Labs, but a note
in the source code gives permission for fairly free use.  For the
precise conditions, see that note.


Layout of the material

There are three programs, learn, lcount and learn.tee.  Learn is the
front end and the user only needs to find that.

When you configure the software you can control where all the
components are stored.

The lessons are text files.  They are stored in the lib directory
which contains a directory for each course.  Lesson 3.1a is in
the file L3.1a and so on.

The directory man contains the manual entry in nroff (man) format.
Once the software is installed, type "man learn" to read it.

See the file INSTALL for instructions on configuration, building
and installation.