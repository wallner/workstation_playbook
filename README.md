# Florian Wallners Workstation Setup

howto:
To setup the workstation run:
 $ ./kickstart.sh

The playbook supports tags for specific tasks:
 - `upgrade`: Run a full system-wide package upgrade (dnf upgrade). Disabled by default.
   Example: `ansible-playbook -K playbook.yml --tags upgrade`
