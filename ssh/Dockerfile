FROM ubuntu:latest
MAINTAINER bbkim <bbkim@gmail.com>

### server setting ###
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y openssh-server aptitude net-tools curl vim
RUN apt-get install -y xinetd
RUN apt-get install -y gdb
RUN apt-get install -y git

### ssh setting ###
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config

RUN echo 'root:toor' | chpasswd 
EXPOSE 22 

CMD /usr/sbin/sshd -D
ENTRYPOINT service ssh restart && bash 
