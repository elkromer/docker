
==Prepare CentOS7 VM==

1. install docker to centos7 (Some CentOS7 already installed docker)
2. shutdown the firewall for centos
3. add docker group 
    sudo groupadd docker
    sudo gpasswd -a $(USER) docker
    sudo service docker restart


==Usage of makefile==  

- make auth 
    Config ssh publickey authentication to remote CentOS7.
- make start
    Start all docker container that described in "dockerfiles" folder.
- make start image=image1
    Start docker container where the image name equal to image1
- make stop
    Stop all running docker containers.
- make stop image=image1
    Stop docker containers where image name equal to image1
- make status
    View status of all running docker containers.


==Docker files comments==

1. The docker file name must be lowercase

2. The command for starting docker contains is locate at the head of the docker files. It must be starting with '#', for example:
   <openssl13>
   #docker run -d -p 10443:443 -it --name=ipworks_openssl13_rsa openssl13 /bin/bash -c "cd /usr/local/openssl-1.1.1c && ./bin/openssl s_server -accept 443 -cert mycert.pem -www -debug -tls1_3 -msg"
   #docker run -d -p 10444:443 -it --name=ipworks_openssl13_ec256 openssl13 /bin/bash -c "cd /usr/local/openssl-1.1.1c && ./bin/openssl s_server -accept 443 -cert myec256cert.pem -www -debug -tls1_3 -msg"
   #docker run -d -p 10445:443 -it --name=ipworks_openssl13_ec384 openssl13 /bin/bash -c "cd /usr/local/openssl-1.1.1c && ./bin/openssl s_server -accept 443 -cert myec384cert.pem -www -debug -tls1_3 -msg"
   #docker run -d -p 10446:443 -it --name=ipworks_openssl13_ec512 openssl13 /bin/bash -c "cd /usr/local/openssl-1.1.1c && ./bin/openssl s_server -accept 443 -cert myec512cert.pem -www -debug -tls1_3 -msg"

  ......


   </openssl13>