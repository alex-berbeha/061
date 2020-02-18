yum update -y
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
usermod -a -G docker vagrant
systemctl enable docker
docker run -d --name db berbehaolexandr/mysql
docker run --link db:db -d -p 80:80  berbehaolexandr/wp-epam
