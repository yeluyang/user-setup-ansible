.PHONY: debug
debug:
	-ansible-playbook main.yml -i inventory/remote.yml -t debug --skip-tags always
	-ansible-playbook main.yml -c local -i inventory/local.yml -t debug --skip-tags always

.PHONY: basic_remote
basic_remote:
	ansible-playbook main.yml -i inventory/remote.yml -t cli --skip-tags debug pro

.PHONY: basic_local
basic_local:
	ansible-playbook main.yml -c local -i inventory/local.yml -t cli --skip-tags debug pro

.PHONY: remote
remote:
	ansible-playbook main.yml -i inventory/remote.yml --skip-tags debug

.PHONY: remote_%
remote_%:
	ansible-playbook main.yml -i inventory/remote.yml --skip-tags debug -t $*

.PHONY: local
local:
	ansible-playbook main.yml -c local -i inventory/local.yml --skip-tags debug

.PHONY: local_%
local_%:
	ansible-playbook main.yml -c local -i inventory/local.yml --skip-tags debug -t $*
