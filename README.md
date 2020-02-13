# bashfulrobot-ansible

Ansible Repo that utilizes an ansible-pull command to configure my workstations.

## Status

Tested for Ubuntu 19.10. Dropped support for pre-19.10. BUT the only issue would be the `seafile-cli` package as it was not in the main PPA's previously (but now is).

Currently this repo is working without issue (using a tasks based approach); however, the repo includes a few "work in progress" and testing scripts that are never called in the main automation. They may be utilized at a later date. I have tried to make it clear so that if anyone decides to use this as a base - it is easy to remove (if unwanted or needed).

I am considering a refactor to Ansible Roles. If I do so, I will likely put the "tasks" based approach into a branch for the history. With this I am currently considering how to impliment roles due to the larger number of desktop software packages installed. It does not make sense to me to have an individual role for each package.

I seem to have an occasional time where I commit a change to the repository and for some reason `ansible-pull` reports that there are no changes. WHen I know there are, I may run `sudo ansible-pull -U https://github.com/haploeco/bashfulrobot-ansible.git`. I suspect it has something to do 

Open to suggestions via issues for improvements.

## My Workflow

```bash
git clone https://github.com/haploeco/bashfulrobot-ansible.git
cd bashfulrobot-ansible
bash deploy.sh
```

Then anytime I install _any_ software, I do so via this repo, so that all of my workstations inherit the changes and configuration.

If you combine the above with some sort of file sync solution (I ue Seafile) that supports encryption, I can usually recover a system to about 95% completion within 40 minutes or so. And there is very little I have to remember (documented via code), or complete manually.

## Usage for you

This might serve as a good starting point for configuring an Ubuntu system. If forking, you will need to change the variable for your username and home directory. Ensure that you do not add my SSH key (script pulls from GitHub). :-) Audit thouroughly if you plan to use.

## TODO

- Fix permission issues. Causes `ansible-pull` to choke due to local changes (permissions in the local repo).
  - Can be fixed with:
    - bash/zsh: `cd $HOME/.ansible/pull/bashfulrobot && git checkout -- $(git ls-files -m)`
  - This can cause the cronjob to not work.
- Add startup items
- create skeleton for removing software
  - single one off runs.
- Budgie panels have a unique ID.
  - Need to identify (`dconf list /com/solus-project/budgie-panel/panels/ | cut -d "/" -f1`)
  - Set ansible vars dynamically for each host to remember panels
    - Need to keep it from slowing down later processing
    - Need to figure out how to track state (i.e.) Panels added and removed
    - How to add a panel via dconf (is it possible?)
      - but can get and edit primary panel settings.
    - Look into leveraging the default install panel INI file.
  - Remove panel shadows
    - depends on panel work
  - Add github release files such as shfmt, etc.
- Install virtualbox
- Install <https://github.com/kaepora/diskgem/releases>
