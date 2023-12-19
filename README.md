# Ansible Collection - nephelaiio.rke

[![Build Status](https://github.com/nephelaiio/ansible-collection-rke/actions/workflows/molecule.yml/badge.svg)](https://github.com/nephelaiio/ansible-collection-rke/actions/wofklows/molecule.yml)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nephelaiio.rke-blue.svg)](https://galaxy.ansible.com/ui/repo/published/nephelaiio/rke/)

An [ansible collection](https://galaxy.ansible.com/ui/repo/published/nephelaiio/rke/) to install and manage rke clusters

## Collection roles

* nephelaiio.rke.rke
* nephelaiio.rke.k8s

## Collection playbooks

* nephelaiio.rke.install: Install and (re)configure cluster
* nephelaiio.rke.restart: Stop mongos cluster services
* nephelaiio.rke.update: Start mongos cluster services

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests.

Role is tested against the following distributions (docker images):

  * Ubuntu Jammy

You can test the collection directly from sources using command `make test`

## ToDo

Add tests for the following platforms
* Ubuntu Focal
* Rocky Linux 9
* Debian 12
* Debian 11

``` yaml
matrix:
  scenario:
    - name: install
  image:
    - url: https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
    - url: https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2
    - url: https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2
    - url: https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2
```

## License

This project is licensed under the terms of the [MIT License](/LICENSE)

