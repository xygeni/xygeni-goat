# pass

resource "aws_ebs_volume" "enabled" {
  availability_zone = "us-west-2a"
  size              = 20

  encrypted = true
}