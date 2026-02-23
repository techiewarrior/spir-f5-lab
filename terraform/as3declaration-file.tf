# Render as3certs Template File
locals {
  as3certs = templatefile(
    "${path.module}/templates/as3certdeclarationtemplate.json",
    {
      EXAMPLE01A_ECDSA_CERT = fileexists("example01a.f5lab.dev.cert") ? file("example01a.f5lab.dev.cert") : "null"
      EXAMPLE01A_ECDSA_KEY  = fileexists("example01a.f5lab.dev.key") ? file("example01a.f5lab.dev.key") : "null"
      EXAMPLE01B_ECDSA_CERT = fileexists("example01b.f5lab.dev.cert") ? file("example01b.f5lab.dev.cert") : "null"
      EXAMPLE01B_ECDSA_KEY  = fileexists("example01b.f5lab.dev.key") ? file("example01b.f5lab.dev.key") : "null"
    }
  )
}

resource "local_file" "as3certs_rendered" {
  depends_on = [null_resource.ecdsa_certs]
  content    = local.as3certs
  filename   = "../ATC/AS3/Step3_as3_ecdsaCerts_Autodiscovery.json"
}
