Sachen die noch zu automatisieren sind:
- Konfiguration der Maus

- Black Box (Terminal Emulator) konfigurieren

-  i915.preliminary_hw_support=1 in "/etc/default/grub" eintragen
- sudo grubby --update-kernel=ALL --args="acpi_osi=Linux"

howto:
To setup the workstation run:
 $ ./kickstart.sh

The playbook supports tags for specific tasks:
 - `upgrade`: Run a full system-wide package upgrade (dnf upgrade). Disabled by default.
   Example: `ansible-playbook -K playbook.yml --tags upgrade`
