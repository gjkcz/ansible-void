Ansible files for managing classroom machines at GJK.

There are two classrooms, POV and POM. All machines are running [Void Linux](https://voidlinux.org/) with [Gnome](https://www.gnome.org/) in dual-boot with Windows.

GDM configuration can be found at <https://help.gnome.org/system-admin-guide/index.html>.

## New client installation

There are several differences in the hardware. System installation is usually done in EFI, ~though MBR still exists on older machines in POV~.

- Install Void
- Update `xbps`: `xbps-install -Su xbps`
- Install `python3` and `avahi`: `xbps-install python3 avahi`
- Enable `avahi` service: `ln -s /etc/sv/avai-deamon/ /var/service/`
- Enable `sshd` service: `ln -s /etc/sv/sshd/ /var/service`
- Import your SSH key to `/root/.ssh/authorized_keys`

Void has `prohibit-password` for root in the default `sshd` configuration. Post-installation setup can be automated using a script or USB keyboard injector.

## Running a playbook

Here are some examples for running a playbook.

```
ansible-playbook setup.yaml
ansible-playbook -l teachers setup.yaml
ansible-playbook -l VU00.local setup.yaml
ansible-playbook --key-file ~/.ssh/keys/gjk-ansible setup.yaml
```

Tags can be used to execute or exclude specific parts of the playbook.

```
ansible-playbook -t grub setup.yaml
ansible-playbook -t [grub, software] setup.yaml
ansible-playbook --skip-tags software setup.yaml
```

## SSH configuration

You should setup your ssh to avoid unnecessary settings when running a playbook, for example:

```
Host VU* MU*
	User root
	IdentityFile ~/.ssh/keys/gjk-ansible
	StrictHostKeyChecking no
	UserKnownHostsFile=/dev/null
```
