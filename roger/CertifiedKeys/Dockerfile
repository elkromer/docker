#docker run -d -it --restart=always --name=ipworksssh_openssh79 -p 2222:22 /bin/bash -c "/usr/local/sbin/sshd -D"

FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y wget && apt-get install -y make && apt-get install -y gcc && apt-get install -y libz-dev && apt-get install -y libssl-dev && apt-get install -y openssh-server

RUN wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.9p1.tar.gz
RUN tar -xvf openssh-7.9p1.tar.gz && cd /openssh-7.9p1 && ./configure && make && make install

RUN groupadd richl.devp
RUN useradd richl2 -m -s /bin/bash
RUN usermod -aG richl.devp richl2
RUN echo 'richl2:nbanana' | chpasswd

COPY ca.pub          /usr/local/etc/ca.pub
COPY id_rsa          /home/richl2/.ssh/id_rsa
COPY id_rsa.pub      /home/richl2/.ssh/id_rsa.pub
COPY id_rsa-cert.pub /home/richl2/.ssh/id_rsa-cert.pub

RUN sed -i 's/#AuthorizedKeysCommand none/AuthorizedKeysCommand \/bin\/echo richl2@richl.devp/'                               /usr/local/etc/sshd_config
RUN sed -i 's/#AuthorizedKeysCommandUser nobody/AuthorizedKeysCommandUser root\nTrustedUserCAKeys \/usr\/local\/etc\/ca.pub/' /usr/local/etc/sshd_config

EXPOSE 22
CMD ["/openssh-7.9p1/sshd", "-D"]