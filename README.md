Cirrus
==========

## Description

Setup your cloud using [Openshift Origin][] with Vagrant.

## Prerequisites

It has been tested using :
* [Virtualbox][] 4.2.2
* [Vagrant][] 1.7

## Installation

* Download box and tools

        $ make init

* Create virtual machine:

        $ vagrant up

* Check Openshift Origin tools :

        $ ./oc version
        oc v1.0.8
        kubernetes v1.1.0-origin-1107-g4c8e6f4

* Authenticate using (admin/password):

        $ oc login
        Server [https://localhost:8443]:
        Authentication required for https://localhost:8443 (openshift)
        Username: admin
        Password:
        Login successful.

        You have access to the following projects and can switch between them with 'oc project <projectname>':

        * default (current)
        * turbo

        Using project "default".

* Open you browser and go to the following URL: `https://localhost:8443`





## License

See [LICENSE][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>



[Cirrus]: https://github.com/portefaix/cirrus
[LICENSE]: https://github.com/portefaix/cirrus/blob/master/COPYING
[Issue tracker]: https://github.com/portefaix/cirrus/issues

[Openshift Origin]: http://www.openshift.org
[Kubernetes]: https://github.com/GoogleCloudPlatform/kubernetes
[Docker]: https://www.docker.io

[Vagrant]: http://www.vagrantup.com
[Virtualbox]: https://www.virtualbox.org
