INVENTORY := inventory.yml
USER := $(shell whoami)
ANSIBLE_USER = $(USER)
PUSH = pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -e ansible_user=$(ANSIBLE_USER) -i $(INVENTORY)

install:
	pipenv sync
	git submodule update --init

run-inventory:
	$(PUSH) -i inventory.yml --become-method=sudo --become-user=$(USER) --become

run-local-other-user: INVENTORY = inventory-local.yml
run-local-other-user:
	$(PUSH) --connection=local --become-method=sudo --become-user=$(USER) --become

run-local: INVENTORY = inventory-local.yml
run-local:
	$(PUSH) --connection=local
