- name: Get router info
  hosts: router
  gather_facts: no
  tasks:
    - name: Run raw command to get router version/info
      ansible.builtin.raw: "show version"   # or "display version" or your actual CLI command
      register: output

    - name: Display output
      ansible.builtin.debug:
        var: output.stdout


all:
  hosts:
    router:
      ansible_host: 192.168.30.1
      ansible_user: admin
      ansible_password: admin123
      ansible_ssh_common_args: '-oKexAlgorithms=+diffie-hellman-group14-sha1 -oHostkeyAlgorithms=+ssh-rsa'
      ansible_connection: ssh
      ansible_shell_type: sh
      ansible_python_interpreter: /bin/false

        
