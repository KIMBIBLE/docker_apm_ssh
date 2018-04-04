FROM ubuntu:latest
MAINTAINER bbkim <bbkimdev@gmail.com>

### server setting ###
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y dialog apt-utils
RUN apt-get install -y openssh-server aptitude net-tools curl vim
RUN apt-get install -y apache2
RUN apt-get install -y xinetd
#RUN apt-get install -y gdb
#RUN apt-get install -y git

### ssh setting ###
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config

### apm setting ###
# apache setting
#CMD ["echo", "-e", "'\nServerName localhost' >> /etc/apache2/apache2.conf"]
RUN echo \\n\\nServerName localhost >> /etc/apache2/apache2.conf
RUN service apache2 restart

# mysql install (root : toor)
RUN echo "mysql-server-5.6 mysql-server/root_password password toor" | debconf-set-selections
RUN echo "mysql-server-5.6 mysql-server/root_password_again password toor" | debconf-set-selections
RUN apt-get install -y mysql-server

### php setting ###
RUN apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
RUN apt-get install -y php-cli
RUN service apache2 restart

### etc setting ###
RUN echo 'root:toor' | chpasswd
EXPOSE 22 80 44

CMD /usr/sbin/sshd -D
ENTRYPOINT service apache2 restart && service mysql restart && service ssh restart && bash

