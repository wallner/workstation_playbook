Sachen die noch zu automatisieren sind:
- Konfiguration der Maus

- Black Box (Terminal Emulator) konfigurieren

-  i915.preliminary_hw_support=1 in "/etc/default/grub" eintragen
- sudo grubby --update-kernel=ALL --args="acpi_osi=Linux"

- Folgende Gnome-Shell Extensions von der Website installieren:
  - Night Theme Switcher

howto:
 $ dnf install ansible
 $ ansible-galaxy collection install community.general -p collections
 $ ansible-playbook -K playbook.yml
