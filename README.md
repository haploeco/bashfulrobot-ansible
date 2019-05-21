# bashfulrobot-ansible

Ansible Repo that utilizes an ansible-pull command to configure my workstations.

## Status

I plan to refactor this into tasks. Currently working without issue; however the repo includes a few "work in progress" and testing scripts that are never called in the main automation. I plan to clean up the repo and weed out what is not actually used. Considering putting the "tasks" based approach into a branch for the history.

Open to suggestions via issues for improvements.

## My Workflow

```bash
wget http://deploy.bashfulrobot.com/laptop
chmod u+x ./laptop
./laptop
```

This is simply a redirect that pulls the raw output of the `deploy.sh` script in this repo. This will bootstrap Ansible, and add a cronjob that will check the repo every 10 minutes for changes, and only run on the machine *if* the repo has a change.

Then anytime I install *any* software, I do so via this repo, so that all of my workstations inherit the changes and configuration.

## Usage for you

This might serve as a good starting point for configuring an Ubuntu system. If forking, you will need to change the variable for your username and home directory. Ensure that you do not add my SSH key (script pulls from GitHub). :-) Audit thouroughly if you lan to use.

## TODO

* Fix permission issues. Causes `ansible-pull` to choke due to local changes (permissions in the local repo).
  * Can be fixed with:
    * fish: `cd $HOME/.ansible/pull/bashfulrobot && git checkout -- (git ls-files -m)`
    * bash: `cd $HOME/.ansible/pull/bashfulrobot && git checkout -- $(git ls-files -m)`
  * This can cause the cronjob to not work.
* Automate ffsend install
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
  * Add compact mode for budgie menu
    * depends on panel work
  * Remove panel shadows
    * depends on panel work
  * Add github release files such as shfmt, etc.
  * Install NVIDIA drivers based on host
  * `sudo ubuntu-drivers autoinstall`
  * `sudo add-apt-repository ppa:graphics-drivers/ppa`
* Install gnome-boxes
  * Apply 18.x fixes
* Install Standard Notes
* Install https://github.com/kaepora/diskgem/releases
