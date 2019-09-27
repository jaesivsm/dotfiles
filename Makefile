USER := $(shell whoami)

run:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inv.yml -e ansible_user=$(USER)
