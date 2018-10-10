# bashfulrobot-ansible
Ansible Repo that utilizes an ansible-pull command to configure my laptop

## My Workflow

```
wget http://deploy.bashfulrobot.com/laptop
chmod u+x ./laptop
./laptop
```

This is simply a redirect that pulls the raw output of the `deploy.sh` script in this repo. This will bootstrap Ansible, and add a cronjob that will check the repo every 10 minutes for changes, and only run on the machine *if* the repo has a change.

Then anytime I install *any* software, I do so via this repo, so that all of my workstations inherit the changes and configuration.

## Usage for you

This might serve as a good starting point for configuring an Ubuntu system. If forking, you will need to change the variable for your username and home directory. Ensure that you do not add my SSH key (script pulls from GitHub). :-) Audit thouroughly if you lan to use.

## TODO

* Add dotfile cfg
* Add startup items
* create skeleton for removing software
  * single one off runs.
