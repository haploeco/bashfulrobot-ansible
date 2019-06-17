# bashfulrobot-ansible

Ansible Repo that utilizes an ansible-pull command to configure my workstations.

## Status

Currently this repo is working without issue (using a tasks based approach); however the repo includes a few "work in progress" and testing scripts that are never called in the main automation. I plan to clean up the repo and weed out what is not actually used.

I am considering a refactor to Ansible Roles. If I do so, I will likely put the "tasks" based approach into a branch for the history. With this I am currently considering how to impliment roles due to the larger number of desktop software packages installed. It does not make sense to me to have an individual role for each package.

Open to suggestions via issues for improvements.

## My Workflow

```bash
git clone https://github.com/bashfulrobot/bashfulrobot-ansible.git
cd bashfulrobot-ansible
bash deploy.sh
```

This is simply a redirect that pulls the raw output of the `deploy.sh` script in this repo. This will bootstrap Ansible, and add a cronjob that will check the repo every 10 minutes for changes, and only run on the machine *if* the repo has a change.

Then anytime I install *any* software, I do so via this repo, so that all of my workstations inherit the changes and configuration.

## Usage for you

This might serve as a good starting point for configuring an Ubuntu system. If forking, you will need to change the variable for your username and home directory. Ensure that you do not add my SSH key (script pulls from GitHub). :-) Audit thouroughly if you lan to use.

## TODO

* Fix permission issues. Causes `ansible-pull` to choke due to local changes (permissions in the local repo).
  * Can be fixed with:
    * fish: `cd $HOME/.ansible/pull/bashfulrobot && git checkout -- (git ls-files -m)`
    * bash/zsh: `cd $HOME/.ansible/pull/bashfulrobot && git checkout -- $(git ls-files -m)`
  * This can cause the cronjob to not work.
* Add startup items
* create skeleton for removing software
  * single one off runs.
* Budgie panels have a unique ID.
  * Need to identify (`dconf list /com/solus-project/budgie-panel/panels/ | cut -d "/" -f1`)
  * Set ansible vars dynamically for each host to remember panels
    * Need to keep it from slowing down later processing
    * Need to figure out how to track state (i.e.) Panels added and removed
    * How to add a panel via dconf (is it possible?)
      * but can get and edit primary panel settings.
    * Look into leveraging the default install panel INI file.
  * Add compact mode for budgie menu
    * depends on panel work
  * Remove panel shadows
    * depends on panel work
  * Add github release files such as shfmt, etc.
  * Install NVIDIA drivers based on host
  * How to reliably detect if there is nvidia obn host in Ansible.
  * `sudo ubuntu-drivers autoinstall`
  * `sudo add-apt-repository ppa:graphics-drivers/ppa`
* Install virtualbox
* Install Standard Notes
* Install https://github.com/kaepora/diskgem/releases
