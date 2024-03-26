# Ansible Collection - nephelaiio.rke

[![Build Status](https://github.com/nephelaiio/ansible-collection-rke/actions/workflows/molecule.yml/badge.svg)](https://github.com/nephelaiio/ansible-collection-rke/actions/wofklows/molecule.yml)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nephelaiio.rke-blue.svg)](https://galaxy.ansible.com/ui/repo/published/nephelaiio/rke/)

An [ansible collection](https://galaxy.ansible.com/ui/repo/published/nephelaiio/rke/) to install and manage rke clusters

## Collection Variables

The following is the list of parameters intended for end-user manipulation: 

Cluster wide parameters

| Parameter            |             Default | Type   | Description                            | Required |
|:---------------------|--------------------:|:-------|:---------------------------------------|:---------|
| rke_cluster_name     |                 n/a | string | Cluster name, immutable after creation | yes      |
| rke_release_rke      |              v1.5.6 | string | RKE release to deploy                  | no       |
| rke_release_k8s      | v1.27.11-rancher1-1 | string | K8s release to deploy                  | no       |
| rke_release_docker   |              24.0.9 | string | Docker release to deploy               | no       |
| rke_retry_num        |                  10 | bool   | Max number of task retries             | no       |
| rke_retry_delay      |                  30 | bool   | Task delay on retries                  | no       |
| rke_backup_interval  |                   1 | bool   | Backup interval in hours               | no       |
| rke_backup_retention |                  24 | bool   | Backup retention in hours              | no       |
| rke_evict_timeout    |                 300 | bool   | Node drain eviction timeout in seconds | no       |

## Collection roles

* nephelaiio.rke.rke
* nephelaiio.rke.k8s

## Collection playbooks

* nephelaiio.rke.install: Install and (re)configure cluster
* nephelaiio.rke.k8s: Deploy base K8s services
* nephelaiio.rke.restart: Stop mongos cluster services
* nephelaiio.rke.update: Start mongos cluster services

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests.

Role is tested against the following distributions (docker images):

  * Ubuntu Jammy
  * Ubuntu Focal
  * Rocky Linux 9

You can test the collection directly from sources using command `make test`

## License

This project is licensed under the terms of the [MIT License](/LICENSE)

