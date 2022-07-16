# Ansible commands 
apt update
apt install python3 ansible openssh-client vim iputils-ping

ssh-keygen
ssh-copy-id root@172.17.0.3

ansible-playbook web.yml -i hosts -e 'ansible_python_interpreter=/usr/bin/python3'



We require a root password and openssh-server enabled on the server to which we need to connect

vim /etc/ssh/sshd_config - setting permission to allow root login

