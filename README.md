Stouts.supervisor
=================

[![Build Status](https://travis-ci.org/Stouts/Stouts.supervisor.png)](https://travis-ci.org/Stouts/Stouts.supervisor)

Ansible role which manage [supervisor](http://supervisord.org)

#### Variables
```yaml
supervisor_enabled: yes                   # The role is enabled
supervisor_cfgdir: /etc/supervisor        # path to config directory
supervisor_logdir: /var/log/supervisor    # path to logs directory
supervisor_incdir: "{{supervisor_cfgdir}}/conf.d" # path to include directory
supervisor_tasks: []                      # List of supervisor tasks
                                          # Ex. supervisor_tasks:
                                          #       - name: <name>
                                          #         option: value
                                          #         option: value
                                          #         option: value
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
```

#### License

Licensed under the MIT License. See the LICENSE file for details.

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.supervisor/issues)!

