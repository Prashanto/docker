FROM container-registry.oracle.com/os/oraclelinux:9

RUN echo "Hello World"

#update and install sudo
RUN dnf update
RUN dnf install -y sudo
RUN dnf clean all

#create a user aposb
RUN groupadd -r aposb
RUN useradd -g aposb -m -s /bin/bash aposb

#set the password for aposb
RUN echo "aposb:Oracle@2707" | chpasswd

#make aposb admin
#RUN usermod -aG aposb aposb

#set no password sudo access to aposb
RUN echo "aposb ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/aposb_sudo
RUN chmod 0440 /etc/sudoers.d/aposb_sudo

#change user to aposb
USER aposb:aposb

#create volume and use the volume as the current working directory
VOLUME /apps/prashanto/osb
WORKDIR /apps/prashanto/osb

RUN sudo chown -R aposb /apps

#install curl
#RUN sudo yum -y install curl

#print curl version
#RUN echo `curl --version`

#copy scripts to the tmp folder
COPY --chown=aposb . tmp/

#install jdk
RUN chmod +x ./tmp/scripts/installJDK.sh
RUN sh tmp/scripts/installJDK.sh


#install osb
RUN chmod +x ./tmp/scripts/installOSB.sh
RUN sh tmp/scripts/installOSB.sh


#patch
RUN chmod +x ./tmp/scripts/patchOSB.sh
RUN sh tmp/scripts/patchOSB.sh