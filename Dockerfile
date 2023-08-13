# Docker commands to build a minimal Linux system with learn installed.
#
# The user should build like so:
#
#     docker build . -t learnunix
#
# and run the inage like so:
#
#    docker run -it --entrypoint=/bin/bash learnunix
#
# That starts a shell running as the user learner and they can run the learn
# command.  When they end that shell, the container dies.
#
# The default entry point of the container is a script that loops forever, which keeps
# the docker container running until somebody runs docker stop.  So if the container
# is run without specifying the entry point, it still starts up but they have to 
# connect to it using docker exec and shut it down manually using docker stop.

# Build using the bookworm version of Debain (circa 2023).  For other versions, see
# https://www.debian.org/releases/.
FROM debian:bookworm

COPY learn.tar /tmp/learn.tar

# Extract the build script and install the learn material.  Originally the build script
# was in this directory but if this repository is cloned under Windows, any text files 
# will have CR/LF line endings.  That caused the build script to fail when run due to
# the junk at the end of the line.  Keeping it in a tar archive protects it from that.
WORKDIR /tmp
RUN tar xvf learn.tar learn/bin/build.sh; chmod +x learn/bin/build.sh; learn/bin/build.sh

# Run commands as the user learner in that user's ome directory.
WORKDIR /home/learner
USER learner

# The spinner script runs forever doing nothing, which keeps the container running.
# The user can log in to the container.  Alternatively they can run docker like so:
#
#    docker run -it --entrypoint=/bin/bash learnunix
#
# In that case the docker container runs a shell as the user learner.  When the user
# terminates the shell, the docker container dies.

CMD /usr/local/bin/spinner.sh
