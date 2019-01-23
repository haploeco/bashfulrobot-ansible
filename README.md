# bashfulrobot-ansible

Ansible Repo that utilizes an ansible-pull command to configure my workstations.

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

* ~~Add dotfile cfg~~
  * ~~https://github.com/bpaulin/DotFiles_Ansible Seems good~~
  * ~~Create TPL files~~
* automate chezmoi install
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
* Configure/Install Fish
  * Dotfile --> use `chezmoi`
* Install Standard Notes
* Install https://github.com/kaepora/diskgem/releases
