FROM ubuntu:latest
# ...
RUN apt update && apt install  openssh-server sudo -y
RUN mkdir -p /home/sshuser/.ssh
COPY idkey.pub /home/sshuser/.ssh/authorized_keys
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys && \
    chmod 600 /home/sshuser/.ssh/authorized_keys
RUN service ssh start
# FLAW - Expose docker port 22
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
