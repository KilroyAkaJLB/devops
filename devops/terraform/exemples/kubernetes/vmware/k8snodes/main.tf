
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_vcenter_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_host" "vmware02" {
  name = "vmware02.montpellier.lan"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore1" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_datastore" "datastore2" {
  name          = "datastore2"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_datastore" "datastore3" {
  name          = "datastore3"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "DMZ_Interne_Network" {
  name          = "DMZ Interne Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name = var.virtual_machine_template_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


#########################################################
##
## Resources

locals {
  vm_guest_id = "debian10_64Guest"
  vm_cpu = "2"
  vm_disk_label =  "disk0"
  vm_disk_size  = "80"
  vm_disk_thin  = ""

  map_datastore_ids = [data.vsphere_datastore.datastore1.id, data.vsphere_datastore.datastore2.id, data.vsphere_datastore.datastore3.id]
}

resource "vsphere_virtual_machine" "vm" {
  for_each 		= { for vm in var.virtual_machines_list : vm.name => vm }

  datastore_id		= element(local.map_datastore_ids, each.value.datastore_id -1)
  resource_pool_id	= data.vsphere_host.vmware02.resource_pool_id

  network_interface {
    network_id 		= data.vsphere_network.DMZ_Interne_Network.id
    adapter_type    = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  name 			= each.value.name
  guest_id      = local.vm_guest_id

  num_cpus 		= local.vm_cpu
  memory		= each.value.memory
  disk {
    label		        = "${each.value.name}-disk"
    size		        = local.vm_disk_size == "" ? data.vsphere_virtual_machine.template.disks.0.size : local.vm_disk_size
    thin_provisioned	= data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid       = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name       = each.value.name
        domain		    = var.virtual_machine_domain_name
      }
      network_interface {
        ipv4_address	= each.value.ip_adresse
        ipv4_netmask	= "24"
        dns_server_list	= var.virtual_machine_domain_name_dns_server_list
      }
      ipv4_gateway = var.virtual_machine_ipv4_gateway
    }
  }
}