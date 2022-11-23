# K3s

Project to configurate k3s cluster using terraform and ansible

## Project structure 

- azure/ - Terraform scripts to create k3s cluster in Azure
- k3s/ -  Terraform scritps to manager k3s clustes
- scripts/ - Ansible scripts to install and configurate k3s

## Minimum Requirements

- RAM: 1G
- CPU: 1 Minimum

## Networking

|Protocol|	Port |	Source |	Description |
|--------|-------|---------|--------------|
|TCP	|6443	|K3s agent nodes	|Kubernetes API Server|
|UDP	|8472	|K3s server and agent nodes	|Required only for Flannel VXLAN|
|UDP	|51820	|K3s server and agent nodes	|Required only for Flannel Wireguard backend|
|UDP	|51821	|K3s server and agent nodes	|Required only for Flannel Wireguard backend with IPv6|
|TCP	|10250	|K3s server and agent nodes	|Kubelet metrics|
|TCP	|2379-2380	|K3s server nodes	| Required only for HA with embedded etcd|

## Architecture

### Single Server

![Single Server](./docs/assets/images/single-server-architecture-k3s.png)

## Quick-Start Guide

### K3S Single Server 

#### Create Infrastructure

```bash

cd ./azure
terraform apply --auto-approve
module.vm["corvo"].azurerm_linux_virtual_machine.main: Still creating... [30s elapsed]
module.vm["corvo"].azurerm_linux_virtual_machine.main: Still creating... [40s elapsed]
module.vm["corvo"].azurerm_linux_virtual_machine.main: Still creating... [50s elapsed]
module.vm["corvo"].azurerm_linux_virtual_machine.main: Creation complete after 54s [id=/subscriptions/f966f250-34fe-4c57-83b9-4ee6f265a741/resourceGroups/rg-k3s-test/providers/Microsoft.Compute/virtualMachines/corvo]

Apply complete! Resources: 1 added, 4 changed, 0 destroyed.

Outputs:

details = {
  "corvo" = {
    "fqdn" = "corvo.eastus.cloudapp.azure.com" #DNS
    "ip_address" = "" #Public IP
  }
}

```

#### Server configuration

```bash

ssh-keyscan -H [Host IP]  >> ~/.ssh/known_hosts  #Add host's fingerprint 
export K3S_USER=[USER] # Set user login
export K3S_PASSWORD=[PASSWORD USER] # Set user password

ansible-playbook -i hosts.yaml playbooks/install-k3s-single-server.yaml

```

#### K3s Configuration

```bash

cd ./k3s
terraform apply --auto-approve

```

## Docs

https://docs.k3s.io/

https://docs.k3s.io/installation/requirements

https://thenewstack.io/how-rancher-labs-k3s-makes-it-easy-to-run-kubernetes-at-the-edge/

https://mattermost.com/blog/intro-to-k3s-lightweight-kubernetes/
