- name: Get router configuration
  hosts: router
  gather_facts: no
  tasks:
    - name: Get running configuration
      ansible.builtin.raw: "show running-config"  # replace with correct command if needed
      register: config_output

    - name: Save config to local file
      ansible.builtin.copy:
        content: "{{ config_output.stdout }}"
        dest: "/tmp/router_config.txt"
      delegate_to: localhost
