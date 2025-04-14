inventory.yml
all:
  hosts:
    router:
      ansible_host: 192.168.30.1
      ansible_user: admin
      ansible_password: admin123
      ansible_ssh_common_args: '-oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostkeyAlgorithms=+ssh-rsa'
      ansible_connection: ssh

router_info.yml
- name: Get router info
  hosts: router
  gather_facts: no
  tasks:
    - name: Run command to get router info
      ansible.builtin.shell: "show version"  # Change based on actual router CLI
      register: output

    - name: Print output
      ansible.builtin.debug:
        var: output.stdout

ansible-playbook -i inventory.yml router_info.yml


ssh -oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostkeyAlgorithms=+ssh-rsa admin@192.168.30.1

