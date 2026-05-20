resource "aws_instance" "fail" {
  image_id      = "ami-123"
  instance_type = "t2.micro"
  root_block_device {
    encrypted = false
  }
}

resource "aws_instance" "fail2" {
  image_id      = "ami-123"
  instance_type = "t2.micro"
  root_block_device {}
}

resource "aws_instance" "fail3" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    encrypted   = true
  }


  ebs_block_device {
    volume_type = "gp2"
    volume_size = var.ebs_volume_size
    device_name = "/dev/xvdb"
    encrypted   = false
  }
}

resource "aws_instance" "fail4" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    volume_type = "gp2"
    volume_size = var.ebs_volume_size
    device_name = "/dev/xvdb"
    encrypted   = false
  }
}

resource "aws_instance" "fail5" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

# empty array defaults

variable "empty_list" {
  default = []
}

resource "aws_instance" "fail_empty_root_list" {
  image_id      = "ami-123"
  instance_type = "t2.micro"

  root_block_device = "${var.empty_list}"
}

resource "aws_instance" "fail_empty_ebs_list" {
  image_id      = "ami-123"
  instance_type = "t2.micro"

  root_block_device = {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    encrypted   = true
  }

  ebs_block_device = "${var.empty_list}"
}