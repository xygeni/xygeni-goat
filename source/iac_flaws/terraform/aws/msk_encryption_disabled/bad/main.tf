// no encryption at rest or in transit
resource "aws_msk_cluster" "fail_no_encryption" {
  cluster_name           = "example"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = 3

  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }
}

resource "aws_msk_cluster" "fail_insecure_encryption_in_transit" {
  cluster_name           = "example"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = 3

  encryption_info { # Flaw, no encryption in transit
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn

    encryption_in_transit {
      client_broker = "PLAINTEXT"
      in_cluster = false
    }
  }

  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }
}