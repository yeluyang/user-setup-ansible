PLAYBOOK := ansible-playbook main.yml

.PHONY: debug
debug:
	-$(PLAYBOOK) -i inventory/remote.yml -t debug --skip-tags always
	-$(PLAYBOOK) -c local -i inventory/local.yml -t debug --skip-tags always

.PHONY: basic_remote
basic_remote:
	$(PLAYBOOK) -i inventory/remote.yml -t cli --skip-tags debug pro

.PHONY: basic_local
basic_local:
	$(PLAYBOOK) -c local -i inventory/local.yml -t cli --skip-tags debug pro

.PHONY: remote
remote:
	$(PLAYBOOK) -i inventory/remote.yml --skip-tags debug

.PHONY: remote_%
remote_%:
	$(PLAYBOOK) -i inventory/remote.yml --skip-tags debug -t $*

.PHONY: local
local:
	$(PLAYBOOK) -c local -i inventory/local.yml --skip-tags debug

.PHONY: local_%
local_%:
	$(PLAYBOOK) -c local -i inventory/local.yml --skip-tags debug -t $*
