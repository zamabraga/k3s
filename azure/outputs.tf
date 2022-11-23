output "details" {
  value = {
    for k, v in module.vm : k => { fqdn = v.fqdn, ip_address = v.ip_address }
  }
}