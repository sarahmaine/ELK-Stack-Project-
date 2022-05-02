# Scripts-from-GWU-Bootcamp
This repository contains all of the Ansible YAML scripts from the Cloud Security Unit, Bash scrips from the Linux System Administration Unit, and network diagrams from the Cloud Security and Networking Units.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Unit 12 Cloud Security Diagram.png](https://github.com/sarahmaine/Scripts-from-GWU-Bootcamp/blob/main/Diagrams/Unit%2012%20Cloud%20Security%20Diagram.png)
[Unit 13 ELK Stack Project Diagram.png](https://github.com/sarahmaine/Scripts-from-GWU-Bootcamp/blob/main/Diagrams/Unit%2013%20ELK%20Stack%20Project%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml file may be used to install only certain pieces of it, such as Filebeat.

[filebeat-playbook.yml](https://github.com/sarahmaine/Scripts-from-GWU-Bootcamp/blob/main/Ansible/filebeat-config.yml)
[metricbeat-playbook.yml](https://github.com/sarahmaine/Scripts-from-GWU-Bootcamp/blob/main/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

The configuration details of each machine may be found below.

| Name               | Function    | IP Address | Operating System |
|--------------------|-------------|------------|------------------|
| JumpBoxProvisioner | Gateway     | 10.0.0.4   | Linux            |
| Web-1              | DVWA Server | 10.0.0.5   | Linux            |
| Web-2              | DVWA Server | 10.0.0.6   | Linux            |
| ELKStackVM         | ELK Server  | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Personal IP Address

Machines within the network can only be accessed by the JumpBoxProvisioner from IP Address 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name               | Publicly Accessible | Allowed IP Addresses                       |
|--------------------|---------------------|--------------------------------------------|
| JumpBoxProvisioner | Yes                 | Personal                                   |
| Web-1              | No                  | Personal (Access to DVWA GUI) & 10.0.0.4   |
| Web-2              | No                  | Personal (Access to DVWA GUI) & 10.0.0.4   |
| ELKStackVM         | No                  | Personal (Access to Kibana GUI) & 10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible is 

The playbook implements the following tasks:
- The playbook will install docker.io, pip3, and the docker module.
- Then, it will increase the virtual memory for the VM that is used to runk the ELK Server.
- Finally, the plaubook will download and launch the docker container for the ELK Server.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![ELKConfigurationComplete](https://user-images.githubusercontent.com/97468655/166198781-ef82a88d-3451-4ec3-bc7c-7addbc7b8d9d.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 (10.0.0.5)
Web-2 (10.0.0.6)

We have installed the following Beats on these machines:
-FileBeat
-MetricBeat

These Beats allow us to collect the following information from each machine:
- FileBeat monitors, collects, and forwards log data. We could expect to see data from Web Logs or the MySQL database which is insalled on the webservers being monitored. 
- MetricBeat is used to collect metric data. We could expect to see CPU or memory related to services deployed on the servers.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- For FileBeat
- Copy the filebeat-config.yml to etc/ansible/files.
- Update the filebeat-config.yml file with the IP Address of the ELK Stack Server VM on lines 1106 and 1806.
- Run the playbook, and navigate to http://[Elk_VM_PUblic_IP]:5601/ap/kibana to check that the installation worked as expected.

-For MetricBeat
- Copy the metricbeat-config.yml to etc/ansible/files.
- Update the metricbeat-config.yml with the IP Adress of the ELK Stack Server VM on lines 62 and 96.
- Run the playbook, and navigate to http://[Elk_VM_PUblic_IP]:5601/ap/kibana to check that the installation worked as expected.

- _Which file is the playbook? Where do you copy it?_ filebeat-playbook.yml /etc/ansible/roles
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ etc/ansible/hosts
- _Which URL do you navigate to in order to check that the ELK server is running?_ http://[Elk_VM_PUblic_IP]:5601/ap/kibana
