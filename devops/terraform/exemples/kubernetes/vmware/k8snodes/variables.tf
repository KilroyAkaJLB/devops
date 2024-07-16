
variable "vsphere_user" {
  type = string
  description = "Login utilisateur vsphere"
}

variable "vsphere_password" {
  type = string
  description = "Mot de passe utilisateur vsphere"
}

variable "vsphere_vcenter_server" {
  type = string
  description = "Adresse IP ou nom DNS du serveur vSphere"
}

variable "virtual_machine_template_name" {
  type = string
  description = "Nom du modèle de VM"
}

variable "virtual_machine_domain_name" {
  type = string
  description = "Nom DNS du domaine"
}

variable "virtual_machines_list" {
  type = list(object({
    name          = string
    memory        = number
    ip_adresse    = string
    datastore_id  = number  # 1 : datastore1, ..., i: datastorei
  }))
}

variable "virtual_machine_domain_name_dns_server_list" {
  type = list(string)
}
variable "virtual_machine_ipv4_gateway" {
  type = string
  description = "Adresse de la passerelle"
}