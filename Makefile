INVENTORY := inventory.yml
USER := $(shell whoami)
PUSH = pipenv run ansible-playbook push-configs.yml -e dotfile_users=$(USER) -e ansible_user=$(USER) -i $(INVENTORY)

install:
	pipenv sync
	git submodule update --init

run-inventory:
	$(PUSH) -i inventory.yml

run-local-other-user:
	$(PUSH) --connection=local --become-method=sudo --become-user=$(USER) --become

run-local: INVENTORY = inventory-local.yml
run-local:
	$(PUSH) --connection=local
