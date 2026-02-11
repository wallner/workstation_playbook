# Fedora Workstation Playbook

This repository contains an Ansible playbook and supporting scripts to automate the setup and configuration of a Fedora-based workstation. It handles package installation, development environment configuration, dotfiles deployment, and system tweaks.

## Features

- **Automated Package Management**: Installs a curated list of system utilities, desktop applications, and development tools via DNF.
- **Development Runtimes**: Sets up environments for Node.js, Go, Java (OpenJDK 21 & 25), and Rust (Cargo).
- **Dotfiles Management**: Uses [GNU Stow](https://www.gnu.org/software/stow/) to manage configuration files from a separate dotfiles repository.
- **Container Ready**: Configures Podman as the primary container engine.
- **Flatpak Integration**: Automatically installs and configures Flatpak applications and the Flathub repository.
- **GNOME Customization**: Configures GNOME settings and extensions via Dconf and dedicated roles.
- **Automated Testing**: Includes a Vagrant-based test environment to validate the entire setup against the latest Fedora releases.

## Project Structure

- `playbook.yml`: The main entry point for the Ansible playbook.
- `kickstart.sh`: A bootstrap script to install Ansible and run the playbook on a fresh system.
- `requirements.yml`: Defines Ansible Collections and Roles dependencies.
- `Vagrantfile`: Configuration for the automated testing environment using Libvirt/KVM.
- `tasks/`: Modularized Ansible task files (e.g., `packages.yml`, `java.yml`, `dotfiles.yml`).
- `variables/`: Configuration variables for package lists and application settings.

## Usage

### On a Fresh Fedora Installation

1.  Clone this repository:
    ```bash
    git clone https://github.com/wallner/workstation_playbook.git
    cd workstation_playbook
    ```
2.  Run the bootstrap script:
    ```bash
    ./kickstart.sh
    ```
    The script will install Ansible, fetch dependencies, and prompt for your sudo password to begin the configuration.

### Local Testing with Vagrant

To validate changes or test the playbook on a fresh Fedora instance without affecting your host system:

1.  Ensure you have `vagrant` and `vagrant-libvirt` installed.
2.  Start the test environment:
    ```bash
    vagrant up
    ```
    This will spin up a Fedora 43 (or latest) VM, resize its disk to 60GB, and run the `kickstart.sh` script inside the VM as the `vagrant` user.

## Customization

- **Packages**: Modify `variables/packages.yml` to add or remove DNF packages.
- **Node Tools**: Update `variables/node_tools.yml` to change the list of global NPM packages.
- **Hostname**: Adjust the `hostname` variable in `variables/configuration.yml`.

## License

This project is open-source and available under the MIT License.
