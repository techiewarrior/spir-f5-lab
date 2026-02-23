# Select BIG-IP AMI to use
data "aws_ami" "bigip" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.f5_ami_search_name]
  }

  owners = ["679593333241"]  # ← F5Networks AWS Marketplace account ID [web:151]
}

data "aws_ami" "linux" {
  most_recent = true

  owners = ["amazon"]  # ← ADD THIS (Amazon Linux)

  filter {
    name   = "name"
    values = [var.linux_ami_search_name]
  }
}

output "f5_ami_name" {
  value = data.aws_ami.bigip.name
}

output "f5_ami_id" {
  value = data.aws_ami.bigip.id
}

output "linux_ami_name" {
  value = data.aws_ami.linux.name
}

output "linux_ami_id" {
  value = data.aws_ami.linux.id
}

