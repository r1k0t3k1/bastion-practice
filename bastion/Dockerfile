FROM ubuntu:latest
RUN apt update && apt install -y openssh-server nmap

RUN echo "root:toor" | chpasswd
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN mkdir /run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
