ls
cd /home
ls
cd ..
ls
sudo apt update
exit
docker -version
docker pull fauria/lamp
vi /etc/passwd
sudo vi /etc/passwd
sudo cat /etc/sudoers
exit
ls
docker ps
docker pull fauria/lamp
ls
docker run -d -p 3306:3306 -p 80:80 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql fauria/lamp
docker rm `docker ps -a -q`
docker kill `docker ps -a -q`
docker ps
cd /home/docker
ls
mkdir src
ls
cd src
cd ..
mkdir db
ls
docker run -d -p 80:80 -p 3306:3306 -v /home/docker/src:/var/www/html /home/docker/db:/var/lib/mysql fauria/lamp
docker run -d -p 80:80 -p 3306:3306 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql fauria/lamp
docker ps
service mysql stop
docker run -d -p 80:80 -p 3306:3306 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql fauria/lamp
docker run -d -p 8080:80 -p 3306:3306 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql fauria/lamp
iptables
netstat -l
ls
netstat -nap
docker exec --help
docker ps
docker exec -it f7782f07488a
docker exec -i -t f7782f07488a
docker exec -i -t f7782f07488a /bin/bash
netstat -ntlp
docker exec -i -t f7782f07488a /bin/bash
apt git
apt install -y git
git clone https://github.com/fauria/docker-lamp
ls
cd docker-lamp
ls
vi dockerfi
vi Dockerfile 
vi run-lamp.sh 
docker ps
docker rm `docker ps -a`
docker rm `docker ps -a -q`
docker kill `docker ps -a -q`
docker run -i -t lamp bash .
docker run -it bash --name lamp .
docker ps
docker run -it .
ls
docker build -it --name lamp .
docker build -tag lamp .
docker images
ls
docker build --tag lamp .
docker ps
ls
docker images
docker run --name lamp -d -p 80:80 -p 3306:3306 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql lamp
docker ps
ls
docker run --name lamp -d -p 8080:80 -p 3306:3306 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql lamp
docker run --name lamp_container -d -p 8080:80 -p 3306:3306 -v /home/docker/src:/var/www/html -v /home/docker/db:/var/lib/mysql lamp
docker ps
ls
