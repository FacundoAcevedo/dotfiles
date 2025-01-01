#!/bin/bash

install_on_fedora() {
    sudo dnf install -y ansible
}

install_on_ubuntu() {
    sudo apt-get update
    sudo apt-get install -y ansible
}

install_on_opensuse() {
    sudo zypper ref
    sudo zypper install -y ansible
}

install_on_mac() {
    brew install ansible
}

OS="$(uname -s)"
case "${OS}" in
Linux*)
    if [ -f /etc/os-release ]; then
        # shellcheck disable=SC1091
        . /etc/os-release
        DISTRO=$NAME
        if [[ ${DISTRO,,} == *"opensuse"* ]]; then
            install_on_opensuse
        elif [[ ${DISTRO,,} == *"fedora"* ]]; then
            install_on_fedora
        elif [[ ${DISTRO,,} == *"ubuntu"* ]]; then
            install_on_ubuntu
        elif [[ ${DISTRO,,} == *"debian"* ]]; then
            install_on_ubuntu
        fi
    else
        echo "Unsupported Linux distribution"
        exit 1
    fi
    ;;
Darwin*)
    install_on_mac
    ;;
*)
    echo "Unsupported operating system: ${OS}"
    exit 1
    ;;
esac

#ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."
