# pass

resource "aws_db_instance" "enabled" {
  name           = "name"
  engine         = "mysql"
  instance_class = "db.t3.micro"

  storage_encrypted = true
}
