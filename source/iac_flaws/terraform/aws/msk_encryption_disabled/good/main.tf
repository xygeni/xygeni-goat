// Default encryption_in_transit is safe
resource "aws_msk_cluster" "pass_default_safe_encryption_in_transit" {
  cluster_name           = "example"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = 3

  encryption_info { // pass, default encryption in transit is safe
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
  }

  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }
}

resource "aws_msk_cluster" "pass" {
  cluster_name           = "example"
  kafka_version          = "3.2.0"
  number_of_broker_nodes = 3

  encryption_info { # Flaw, no encryption in transit
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn

    encryption_in_transit {
      client_broker = "TLS"
      in_cluster = true
    }
  }

  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }
}