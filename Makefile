USER := $(shell whoami)

install:
	pipenv sync

run:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inv.yml -e ansible_user=$(USER) --connection=local
