# Docker commands to build a minimal Linux system with learn installed.
#
# The user should build like so:

#     sudo docker build . -t learnunix
#
# and run the inage like so:
#
#    sudo docker run -it --entrypoint=/bin/bash learnunix
#
# That starts a shell running as the user learner and they can run the learn
# command.  When they end that shell, the container dies.
#
# The default entry point of the container is a script that loops forever, which keeps
# the docker container running until somebody runs docker stop.  So if the container
# is run without specifying the entry point, it still starts up but they have to 
# connect to it using docker exec and shut it down manually using docker stop.

FROM ubuntu:18.04

COPY learn /learn

# Make the spinner script executable.
RUN chmod +x /learn/bin/spinner.sh

# Copy the spell script and make it executable. (Spell is a wrapper around aspell.
# The files course expects shell.

COPY learn/bin/spell /bin
RUN chmod +x /bin/spell

WORKDIR /learn

# Man pages and other documentation are excluded from the image by default.  Some of
# the lessons in the learn files course expect man.

RUN rm /etc/dpkg/dpkg.cfg.d/excludes

# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    rm -r /var/lib/apt/lists/*

# Install spell - the files course expects it.  Seems to no longer exist, but
# there is a script that mimics it using aspell.
RUN apt-get update && apt-get install aspell --assume-yes

# Install man.
RUN apt-get update && apt-get install man --assume-yes

# Install the build tools (make, automake, gcc etc).
RUN apt-get update && apt-get install build-essential --assume-yes

RUN ./configure

RUN make install

# Create the user learner in group learner with a home directory and a shell,
# password locked so nobody can log in from outside the container.

RUN groupadd -g 101 learner

RUN useradd -u 101 -g 101 -m learner

RUN usermod -L learner

# Run commands as the user learner
USER learner

#   The user can log in
# to the container.  Alternatively, the user can run docker like so:
#    docker run -it --entrypoint=/bin/bash {container ID or tag}
# In that case the docker container runs a shell as the user learner.  When the user
# terminates the shell, the docker container dies.

CMD /learn/bin/spinner.sh
