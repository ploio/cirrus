# Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP = cirrus
VERSION = 0.1.0

SHELL := /bin/bash

VAGRANT = vagrant
DOCKER = "docker"

ORIGIN_BOX_VERSION = "1.0.7"

ORIGIN_URI=https://github.com/openshift/origin/releases/download
ORIGIN_VERSION=1.0.8
ORIGIN_HASH=6a2b026
        https://github.com/openshift/origin/releases/download/v1.0.8/openshift-origin-v1.0.8-6a2b026-linux-amd64.tar.gz
NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

OUTPUT=bin

all: help

help:
	@echo -e "$(OK_COLOR) ==== [$(APP)] [$(VERSION)]====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- init$(NO_COLOR)    : Initialize environment$(NO_COLOR)"

configure:
	@mkdir bin

.PHONY: box
box:
	@echo -e "$(OK_COLOR)Download Vagrant box$(NO_COLOR)"
	@wget https://drive.google.com/uc?export=download&id=0Bzan56EkcOsxT2pzY2ZUZXFLN0U
	@vagrant box add openshift3 openshift-bootstrap-$(OPENSHIFT_BOX_VERSION).box


.PHONY: tools
tools: configure
	@echo -e "$(OK_COLOR)[$(APP)] Download Openshift Origin tools$(NO_COLOR)"
	curl --silent -o /tmp/origin-v${ORIGIN_VERSION}.tar.gz \
		-L ${ORIGIN_URI}/v${ORIGIN_VERSION}/openshift-origin-v${ORIGIN_VERSION}-${ORIGIN_HASH}-linux-amd64.tar.gz && \
		tar zxvf /tmp/origin-v${ORIGIN_VERSION}.tar.gz -C $(OUTPUT) && \
		rm -rf /tmp/origin-v${ORIGIN_VERSION}.zip

.PHONY: init
init: box tools
