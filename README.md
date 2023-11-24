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
  * Ubuntu Focal
  * Debian Bullseye

You can test the collection directly from sources using command `make test`

## License

This project is licensed under the terms of the [MIT License](/LICENSE)

