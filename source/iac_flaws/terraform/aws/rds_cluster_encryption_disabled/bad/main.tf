# fail

resource "aws_db_instance" "default" {
  name           = "name"
  engine         = "mysql"
  instance_class = "db.t3.micro"
}

resource "aws_db_instance" "disabled" {
  name           = "name"
  engine         = "mysql"
  instance_class = "db.t3.micro"

  storage_encrypted = false
}
