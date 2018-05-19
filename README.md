# alessandria
To use these states you need to inject external pillar from terminal as follow:

sudo salt-call state.sls git pillar='{"my_user": "your unix username","name":"your name","surname": "your surname", "email": "your email address"}'
