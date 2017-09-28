# Usage

```console
ansible-playbook push-configs.yml -e dotfile_users=<comma separated user> -i <your inventory>
```

If you're not connecting with the user you're currently using add ```-e ansible_user=<your connecting user>```
