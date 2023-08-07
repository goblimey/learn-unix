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

COPY build.sh /tmp/build.sh

# Install the software.
RUN chmod +x /tmp/build.sh; /tmp/build.sh

# Run commands as the user learner
USER learner

# The spinner script runs forever doing nothing, which keeps the container running.
# The user can log in to the container.  Alternatively they can run docker like so:
#
#    docker run -it --entrypoint=/bin/bash learnunix
#
# In that case the docker container runs a shell as the user learner.  When the user
# terminates the shell, the docker container dies.

CMD /usr/local/bin/spinner.sh
