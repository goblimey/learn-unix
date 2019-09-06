FROM ubuntu:18.04

COPY learn /learn

WORKDIR /learn

RUN apt-get update && apt-get install build-essential --assume-yes

RUN ./configure

RUN make install

RUN chmod +x /learn/bin/spinner.sh

# Create group 101 "learner"
RUN groupadd -g 101 learner

# Create user 101 "learner"
RUN useradd -u 101 -g 101 -m learner

# Lock the learner password so nobody can log in from outside
RUN usermod -L learner

# Run commands as the user learner
USER learner

# The default entry point of the container is a script that loops forever, which keeps
# the docker container running until somebody runs docker stop.  The user can overide
# this by running docker like so:
#    docker run -it --entrypoint=/bin/bash 892c93414aea
# In that case the docker container runs a shell as the user learner.  When the user
# terminates the shell, the docker container dies.
CMD /learn/bin/spinner.sh