.PHONY: all ${MAKECMDGOALS}

MOLECULE_SCENARIO ?= install
MOLECULE_KVM_IMAGE ?= https://cloud-images.ubuntu.com/daily/server/jammy/current/jammy-server-cloudimg-amd64.img
GALAXY_API_KEY ?=
GITHUB_REPOSITORY ?= $$(git config --get remote.origin.url | cut -d: -f 2 | cut -d. -f 1)
GITHUB_ORG = $$(echo ${GITHUB_REPOSITORY} | cut -d/ -f 1)
GITHUB_REPO = $$(echo ${GITHUB_REPOSITORY} | cut -d/ -f 2)
REQUIREMENTS = requirements.yml
ROLE_DIR = roles
ROLE_FILE = roles.yml
COLLECTION_NAMESPACE = $$(yq '.namespace' < galaxy.yml)
COLLECTION_NAME = $$(yq '.name' < galaxy.yml)
COLLECTION_VERSION = $$(yq '.version' < galaxy.yml)

all: install version lint test

test: lint
	poetry run molecule test -s ${MOLECULE_SCENARIO}

install:
	@type poetry >/dev/null || pip3 install poetry
	@type yq || sudo apt-get install -y yq
	@type nmcli || sudo apt-get install -y network-manager
	@sudo apt-get install -y libvirt-dev
	@poetry install --no-root

lint: install
	poetry run yamllint .

requirements: install
	@rm -rf ${ROLE_DIR}/*
	@python --version
	@poetry run ansible-galaxy role install \
		--force --no-deps \
		--roles-path ${ROLE_DIR} \
		--role-file ${ROLE_FILE}
	@poetry run ansible-galaxy collection install \
		--force-with-deps .
	@\find ./ -name "*.ymle*" -delete

build: requirements
	@poetry run ansible-galaxy collection build --force

dependency create prepare converge idempotence side-effect verify destroy cleanup reset list:
	MOLECULE_KVM_IMAGE=${MOLECULE_KVM_IMAGE} \
	poetry run molecule $@ -s ${MOLECULE_SCENARIO}

ifeq (login,$(firstword $(MAKECMDGOALS)))
    LOGIN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
    $(eval $(subst $(space),,$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))):;@:)
endif

login:
	MOLECULE_KVM_IMAGE=${MOLECULE_KVM_IMAGE} \
	poetry run molecule $@ -s ${MOLECULE_SCENARIO} ${LOGIN_ARGS}

ignore:
	@poetry run ansible-lint --generate-ignore

clean: destroy reset
	@poetry env remove $$(which python) >/dev/null 2>&1 || exit 0

publish: build
	poetry run ansible-galaxy collection publish --api-key ${GALAXY_API_KEY} \
		"${COLLECTION_NAMESPACE}-${COLLECTION_NAME}-${COLLECTION_VERSION}.tar.gz"

version:
	@poetry run molecule --version

debug: version
	@poetry export --dev --without-hashes
