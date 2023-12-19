#!/bin/env bash                                                                     

function slowroll {
    sudo rm /etc/zypp/repos.d/*
    sudo zypper ar --refresh http://cdn.opensuse.org/slowroll/repo/oss/ base-oss
    sudo zypper ar --refresh http://cdn.opensuse.org/slowroll/repo/non-oss/ base-non-oss
    sudo zypper ar --refresh -p 80 http://cdn.opensuse.org/update/slowroll/repo/oss/ update
    sudo zypper ar --refresh --disable http://cdn.opensuse.org/slowroll/repo/src-oss/ base-src-oss
    sudo zypper ar --refresh http://codecs.opensuse.org/openh264/openSUSE_Tumbleweed/ h264
    #sudo zypper ar --refresh -p 70 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Slowroll/Essentials/ packman
    sudo zypper ref
    sudo zypper dup
}

function install-ansible {
    sudo zypper install -y ansible 
}
function install-roles {
    ansible-galaxy install -r requirements.yml
}
function run-playbook{
    ansible-playbook -i inventory.ini playbooks/run.yml -vv $(ansible_playbook_args)
}

case "$1" in
    "slowroll" )
        slowroll;
        echo "Restart is required." ;;
    "run-playbook" )
        install-ansible;
        install-roles;
        run-playbook ;;
    "execute" )
        shift
        execute "$@"
        ;;
    * )
        echo "Usage: ..."
esac
