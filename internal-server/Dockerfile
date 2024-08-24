FROM ubuntu:latest
RUN apt update && apt install -y apache2 openssh-server

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN echo "root:toor" | chpasswd
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN mkdir /run/sshd

EXPOSE 22
EXPOSE 80
CMD /entrypoint.sh
