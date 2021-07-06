.PHONY: all
all:
	-ansible-playbook main.yml -i inventory/remote.yml --check --skip-tags always
	-ansible-playbook main.yml -c local -i inventory/local.yml --check --skip-tags always

.PHONY: basic_remote
basic_remote:
	ansible-playbook main.yml -i inventory/remote.yml -t cli --skip-tags pro

.PHONY: basic_local
basic_local:
	ansible-playbook main.yml -c local -i inventory/local.yml --become -t cli --skip-tags pro

.PHONY: remote
remote:
	ansible-playbook main.yml -i inventory/remote.yml

.PHONY: remote_%
remote_%:
	ansible-playbook main.yml -i inventory/remote.yml -t $*

.PHONY: local
local:
	ansible-playbook main.yml -c local -i inventory/local.yml --become

.PHONY: local_%
local_%:
	ansible-playbook main.yml -c local -i inventory/local.yml --become -t $*
