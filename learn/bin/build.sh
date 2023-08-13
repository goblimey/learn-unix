#! /bin/sh

# Shell script to prepare a docker image to run learn:
#
#    update the list used by the apt command
#    upgrade the system
#    reinstall the default packages but with manual pages (Docker may exclude them)
#    install the make tools (make, gcc etc)
#    create a user to run in the container
#    build and install learn
#    prepare the spinner - a script to keep the docker container running
#
# The default entry point of the container is spinner.sh.  That loops forever, which
# keeps the docker container running until somebody runs docker stop.  So if the
# container is run without specifying the entry point, it still starts up but they 
# have to connect to it using docker exec and shut it down manually using docker stop.
# Alternatively they can log in to the container, which runs under the learn user.

apt update

apt -y upgrade

# Man pages and other documentation may be excluded from the image by default.  Some of
# the lessons in the learn files course expect man.
if test -f /etc/dpkg/dpkg.cfg.d/excludes
then
    rm /etc/dpkg/dpkg.cfg.d/excludes

    # Reinstall all currently installed packages in order to get the man pages back
    apt-get update && \
        dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
        rm -r /var/lib/apt/lists/*
fi


# Install the build tool (gcc etc) plus apt-utils and spell.  If apt-utils is missing
# we get error messages during the build.  They are harmless but could cause confusion.
# Some of the lessons use spell but it may be missing by default.

apt install -y apt-utils build-essential man-db spell


# Create the user learner in group learner with a home directory and a shell,
# password locked so nobody can log in from outside the container.

groupadd -g 1001 learner

useradd -u 1001 -g 1001 -m learner

usermod -L learner

# The learn installer writes to these directories, so they must be present.
mkdir -p /usr/local/share/learn
mkdir -p /usr/local/libexec

# Extract and build the learn software.
cd /tmp
tar xpf learn.tar
cd learn
./configure
make install

# Prepare the spinner script for the container.
cp bin/spinner.sh /usr/local/bin
chmod +x /usr/local/bin/spinner.sh

