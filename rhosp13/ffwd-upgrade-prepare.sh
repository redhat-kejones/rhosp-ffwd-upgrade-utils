#!/usr/bin/env bash

cd ~
source ~/stackrc

time openstack overcloud ffwd-upgrade prepare --templates \
  -r /home/stack/templates/roles_data.yaml \
  -n /home/stack/templates/network_data.yaml \
  -e /home/stack/templates/overcloud_images.yaml \
  -e /home/stack/templates/timezone.yaml \
  -e /home/stack/templates/cloudname.yaml \
  -e /home/stack/templates/inject-trust-anchor-hiera.yaml \
  -e /home/stack/templates/node-info.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/sahara.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-rgw.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/cinder-backup.yaml \
  -e /home/stack/templates/network-isolation.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /home/stack/templates/ceph-environment.yaml \
  -e /home/stack/templates/nested-virt-post-deploy.yaml \
  --timeout 180
