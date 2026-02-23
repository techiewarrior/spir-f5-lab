# Render ImportDevices Template File
locals {
  ImportDevices = templatefile(
    "${path.module}/templates/importdevices_template.json",
    {
      BIGIP_ADMIN_PASSWORD = local.random_password

      BIGIP1_MGMT_IP_ADDRESS = aws_eip.bigip1_mgmt.public_ip
      BIGIP2_MGMT_IP_ADDRESS = aws_eip.bigip2_mgmt.public_ip
    }
  )
}

resource "local_file" "ImportDevices_rendered" {
  content  = local.ImportDevices
  filename = "../ATC/f5extension/devices.json"
}
