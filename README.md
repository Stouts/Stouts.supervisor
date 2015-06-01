Stouts.supervisor
=================

[![Build Status](http://img.shields.io/travis/Stouts/Stouts.sudo.svg?style=flat-square)](https://travis-ci.org/Stouts/Stouts.sudo)
[![Galaxy](http://img.shields.io/badge/galaxy-Stouts.sudo-blue.svg?style=flat-square)](https://galaxy.sudo.com/list#/roles/885)
[![Tag](http://img.shields.io/github/tag/Stouts/Stouts.sudo.svg?style=flat-square)]()

Ansible role which manage [supervisor](http://supervisord.org)

* Install and manage [supervisor](http://supervisord.org)
* Install [superlance](http://superlance.readthedocs.org)
* Manage supervisor tasks
* Provide handlers for reload and restart supervisor

#### Variables

The role variables and default values.

```yaml
supervisor_enabled: yes                   # The role is enabled
supervisor_version: "3.1.2"
supervisor_bindir: "/usr/local/bin"
supervisor_bin: "{{ supervisor_bindir }}/supervisord"
supervisor_pid: /var/run/supervisord.pid
supervisor_nofile: 65356                  # Set max opened files (set blank to default limits)
supervisor_cfgdir: /etc/supervisor        # path to config directory
supervisor_conf_file: "{{ supervisor_cfgdir }}/supervisord.conf"
supervisor_logdir: /var/log/supervisor    # path to logs directory
supervisor_incdir: "{{supervisor_cfgdir}}/conf.d" # path to include directory
supervisor_tasks: []                      # List of supervisor programs
                                          # Ex. supervisor_tasks:
                                          #       - name: <name>
                                          #         option: value
                                          #         option: value
                                          #         option: value
supervisor_events: []                     # similar to tasks/programs but for eventlisteners like crashmail
supervisor_groups: []                     # groups of tasks
supervisor_superlance: no                 # Install superlance (http://superlance.readthedocs.org/
```

#### Usage

Add `Stouts.supervisor` to your roles and set vars in your playbook file.

Example:

```yaml

- hosts: all

  roles:
    - Stouts.supervisor

  vars:
    supervisor_tasks:
        - name: ping
          command: ping google.com
          autostart: true
          autorestart: true
    supervisor_events:
        - name: crashmail
          command: crashmail -p program -m alerts@example.com
          events: PROCESS_STATE_EXITED
    supervisor_groups:
        - name: my_group
          programs: ping
```

#### License

Licensed under the MIT License. See the LICENSE file for details.

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.supervisor/issues)!
