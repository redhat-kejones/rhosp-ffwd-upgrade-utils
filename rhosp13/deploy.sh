#!/usr/bin/env bash

cd ~
source ~/stackrc

#STIG Stuffs
#  -e /home/stack/templates/disable-stigged-services.yaml \
#  -e /home/stack/templates/post-deploy-stig.yaml \

#Disable Telemetry
#  -e /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml

#Enable nested Virt on Hypervisors
#  -e /home/stack/templates/nested-virt-post-deploy.yaml \

#Not Used in RHOSP10 to 13 FFWD Upgrade
#  -e /usr/share/openstack-tripleo-heat-templates/environments/services/barbican.yaml \
#  -e /usr/share/openstack-tripleo-heat-templates/environments/barbican-backend-simple-crypto.yaml \
#  -e /usr/share/openstack-tripleo-heat-templates/environments/services/octavia.yaml \
#  -e /usr/share/openstack-tripleo-heat-templates/environments/enable-swap.yaml \
#  -e /home/stack/templates/octavia-post-deploy.yaml \
#  -e /home/stack/templates/firstboot-environment.yaml \
#  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \

time openstack overcloud deploy --templates \
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
