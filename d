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
