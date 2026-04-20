locals {
  resource_body = {
    properties = {
      credentials = var.credentials == null ? null : {
        certificates = var.credentials.certificates == null ? null : [for item in var.credentials.certificates : item == null ? null : {
          encodedPemCertificate = item.encoded_pem_certificate
          expiry                = item.expiry
          name                  = item.name
          thumbprint            = item.thumbprint
        }]
        passwords = var.credentials.passwords == null ? null : [for item in var.credentials.passwords : item == null ? null : {
          creationTime = item.creation_time
          expiry       = item.expiry
          name         = item.name
        }]
      }
      scopeMapId = var.scope_map_id
      status     = var.status
    }
  }
}
