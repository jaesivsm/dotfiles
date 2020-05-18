USER := $(shell whoami)

install:
	pipenv sync
	git submodule update --init

run:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inv.yml -e ansible_user=$(USER) --connection=local

run-other-user:
	pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -i inv.yml -e ansible_user=$(USER) --connection=local --become-method=sudo --become-user=$(USER) --become
