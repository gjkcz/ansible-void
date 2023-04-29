Ansible files for managing classroom machines at GJK.

There are two classrooms, POV and POM. All machines are running [Void Linux](https://voidlinux.org/) with [Gnome](https://www.gnome.org/) in dual-boot with Windows.

GDM configuration can be found at <https://help.gnome.org/admin/system-admin-guide/stable/index.html.en>.

## New client installation

There are several differences in the hardware. System installation is usually done in EFI, though MBR still exists on older machines in POV.

- Install Void
- Update `xbps`
- Install `python3`
- Import your SSH key to `/root/.ssh/authorized_keys`

Void has `sshd` enabled by default as well as having `prohibit-password` set for root. Post-installation setup can be automated using a script or USB keyboard injector.

## Running a playbook

```
ansible-playbook setup.yaml
ansible-playbook -l teachers setup.yaml
ansible-playbook --key-file ~/.ssh/keys/gjk-ansible setup.yaml
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
