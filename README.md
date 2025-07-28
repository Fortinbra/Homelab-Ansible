# Homelab-Ansible

Ansible automation for homelab infrastructure management.

## Project Structure

```
├── ansible.cfg              # Ansible configuration
├── inventory.yml            # Inventory of homelab hosts
├── First.ansible.yml        # Basic setup playbook
├── Makefile                 # Convenient management commands
├── group_vars/              # Group-specific variables
│   ├── all.yml             # Variables for all hosts
│   └── docker_hosts.yml    # Variables for Docker hosts
├── host_vars/              # Host-specific variables
├── playbooks/              # Additional playbooks
│   ├── docker-setup.yml    # Docker installation
│   └── monitoring-setup.yml # Monitoring setup
└── roles/                  # Custom Ansible roles
```

## Quick Start

### 1. Configure Your Inventory

Edit `inventory.yml` to add your homelab hosts:

```yaml
docker_hosts:
  hosts:
    docker-01:
      ansible_host: 192.168.1.100
      ansible_user: your_username
```

### 2. Update Variables

Edit `group_vars/all.yml` to set your preferences:
- Username
- SSH key path
- Timezone
- Other global settings

### 3. Test Connectivity

```bash
make ping
```

### 4. Run Basic Setup

```bash
make setup
```

## Available Commands

- `make ping` - Test connectivity to all hosts
- `make setup` - Run the basic setup playbook
- `make docker` - Install Docker on docker_hosts
- `make monitoring` - Setup monitoring tools
- `make check` - Check playbook syntax
- `make facts` - Gather facts from all hosts

## Playbooks

### First.ansible.yml
Basic system setup including:
- System updates
- Common package installation
- SSH configuration
- Firewall setup
- Basic security hardening

### playbooks/docker-setup.yml
Docker installation and configuration:
- Docker CE installation
- Docker Compose setup
- User group configuration
- Basic container networking

### playbooks/monitoring-setup.yml
Monitoring tools setup:
- Node Exporter for Prometheus
- System monitoring tools
- Health check scripts

## Security Considerations

- SSH key-based authentication
- Firewall configuration
- Fail2ban installation
- Regular security updates

## Customization

1. **Add New Hosts**: Update `inventory.yml`
2. **Host-Specific Settings**: Create files in `host_vars/`
3. **Group Settings**: Modify files in `group_vars/`
4. **Custom Roles**: Create roles in the `roles/` directory

## Prerequisites

- Ansible installed on control machine
- SSH access to target hosts
- Python on target hosts
- Sudo privileges on target hosts

## Getting Help

Run `make help` to see available commands.