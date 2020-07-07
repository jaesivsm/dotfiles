USER := $(shell whoami)

install:
	pipenv sync
	git submodule update --init

run-local:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inventory-local.yml -e ansible_user=$(USER) --connection=local

run-inventory:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inventory.yml -e ansible_user=$(USER)

run-other-user:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inv.yml -e ansible_user=$(USER) --connection=local --become-method=sudo --become-user=$(USER) --become
