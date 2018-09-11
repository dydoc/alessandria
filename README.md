# Alessandria
To use these states you need to inject external pillar from terminal as follow:

sudo salt-call state.sls git pillar='{"my_user": "your unix username","name":"your name","surname": "your surname", "email": "your email address"}'

## Prerequisite
1) Install Vagrant and ssh server
2) setup sudo to be passwordless
   add "myusername ALL=(ALL) NOPASSWD: ALL" to sudoers with visudo
3) setup ssh access with key

## Usage

* vagrant up
* vagrant provision

after that, salt will be up and running!

To be able to run the highstate, a pillar file with git credentials must
be created: "pillar/git_user"

## Notes

### Sublime

To be able to install and load plugin, restart *two* times the IDE
