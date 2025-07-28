# Homelab Ansible Makefile
# Convenient commands for managing your homelab

.PHONY: help ping setup docker monitoring check syntax lint pi-setup docs

help:
	@echo "Available commands:"
	@echo "  make ping        - Test connectivity to all hosts"
	@echo "  make setup       - Run the basic setup playbook"
	@echo "  make docker      - Install Docker on docker_hosts"
	@echo "  make monitoring  - Setup monitoring tools"
	@echo "  make pi-setup    - Raspberry Pi specific optimizations"
	@echo "  make docs        - Document current system state"
	@echo "  make check       - Check playbook syntax"
	@echo "  make lint        - Lint playbooks with ansible-lint"
	@echo "  make facts       - Gather facts from all hosts"

ping:
	ansible all -m ping

setup:
	ansible-playbook First.ansible.yml

docker:
	ansible-playbook playbooks/docker-setup.yml

monitoring:
	ansible-playbook playbooks/monitoring-setup.yml

pi-setup:
	ansible-playbook playbooks/raspberry-pi-setup.yml

docs:
	ansible-playbook playbooks/current-state-docs.yml

check:
	ansible-playbook --syntax-check First.ansible.yml
	ansible-playbook --syntax-check playbooks/docker-setup.yml
	ansible-playbook --syntax-check playbooks/monitoring-setup.yml
	ansible-playbook --syntax-check playbooks/raspberry-pi-setup.yml
	ansible-playbook --syntax-check playbooks/current-state-docs.yml

lint:
	@if command -v ansible-lint >/dev/null 2>&1; then \
		ansible-lint First.ansible.yml; \
		ansible-lint playbooks/; \
	else \
		echo "ansible-lint not installed. Install with: pip install ansible-lint"; \
	fi

facts:
	ansible all -m setup

dry-run:
	ansible-playbook First.ansible.yml --check --diff

list-hosts:
	ansible all --list-hosts

list-tasks:
	ansible-playbook First.ansible.yml --list-tasks
