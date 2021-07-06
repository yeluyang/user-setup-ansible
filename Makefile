.PHONY: all
all:
	-ansible-playbook main.yml -i inventory/remote.yml --check --skip-tags always
	-ansible-playbook main.yml -c local -i inventory/local.yml --check --skip-tags always

.PHONY: remote
remote:
	ansible-playbook main.yml -i inventory/remote.yml

.PHONY: local
local:
	ansible-playbook main.yml -c local -i inventory/local.yml --become
