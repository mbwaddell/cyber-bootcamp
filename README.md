# cyber-bootcamp
Cybersecurity bootcamp projects
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

 (Diagrams/Virtual Network + ELK-server_BW.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, select playbook file(s) may be used to install only certain pieces of it, such as Filebeat or Metricbeat.

(Ansible/install-elk.yml)
(Ansible/filebeat-playbook.yml)
(Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting access to the network.
The redundancy provided by the load balancer helps protect the Availability of the DVWA web service. The jump box increases security by providing a secure computer from which system admins can launch adminsitrative tasks or connect to other servers or untrusted environments.
    Source: https://www.csoonline.com/article/2612700/security-jump-boxes-improve-security-if-you-set-them-up-right.html

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.
Filebeat provides a simple lightweight means to forward and centralize logs and files and track changes to them.
Metricbeat records metrics from system and network components and processes to detect suspicious changes

The configuration details of each machine may be found below.

| Name       | Function  | IP Address | Operating System   |
|------------|-----------|------------|--------------------|
| Jump Box   | Gateway   | 10.0.0.4   | Linux Ubuntu 18.04 |
| Web-1      | DVWA      | 10.0.0.5   | Linux Ubuntu 18.04 |
| Web-2      | DVWA      | 10.0.0.6   | Linux Ubuntu 18.04 |
| ELK-server | ELK stack | 10.1.0.4   | Linux Ubuntu 18.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from my local host IP address.

Machines within the network can only be accessed by SSH.
The Jump Box (10.0.0.4) was used to access the ELK-server VM (10.1.0.4).

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses |
|-------------|---------------------|----------------------|
| Jump Box    | Yes                 | Local Workstation    |
| Web Servers | No                  | 10.0.0.4             |
| ELK server  | No                  | VNet (10.0.0.0/16)   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows faster implementation while eliminating entry errors during manual configuration.

The playbook implements the following tasks:
- Installs the apt and pip packages required to run and control Docker containers.
- Configures the target VM to use more memory
- Downloads the Docker container image
- Configures the port mappings the container will use for the ELK stack
- Starts the container and configures the Docker service to restart automatically when the VM is rebooted.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/ELK container running.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.5, 10.0.0.6

We have installed the following Beats on these machines:
Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat allows collection and aggreagation of logs from various clients, hosts, containers, cloud resources, etc.  Once aggregated, search   logs by service, app, host, or other criteria to track curious behavior.
- Metricbeat allows monitoring of system metrics and top-like statistics for processes on hosts to detect signs of unusual activity.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Ansible/install-elk.yml file to /etc/ansible/ folder.
- Update the /etc/ansible/hosts file to include a group named [elk] containing the IP address of the ELK server VM. This group will be used for the hosts entry in the header of the playbook to specify which machine to install it on.
- Run the playbook, and navigate to http://[your.ELK-VM.External.IP]:5601/app/kibana to check that the installation worked as expected.
