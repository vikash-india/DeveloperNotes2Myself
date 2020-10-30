# Description: Create Control Machines Inventory

### Note
1. Ansible has a default inventory file at the loation /etc/ansible/hosts for defining the control machines that 
   will be managed by Ansible.
2. One can define ranges of hosts, multiple groups, reusable variables, or dynamic inventory.
3. Backup /etc/ansible/hosts as /etc/ansible/hosts.original and use it for reference.

### Create a New Inventory File
```
sudo mv /etc/ansible/hosts /etc/ansible/hosts.original  # Backup the original for reference. 
sudo gvim /etc/ansible/hosts                            # Create a new inventory file

# Add the following content to /etc/ansible/hosts
[local]
192.168.1.20
mars
```
