resource "aws_elasticache_replication_group" "fail" {
  automatic_failover_enabled = true
  availability_zones = ["us-west-2a", "us-west-2b"]
  replication_group_id = "tf-rep-group-1"
  replication_group_description = "test description"
  node_type = "cache.m4.large"
  number_cache_clusters = 2
  parameter_group_name = "default.redis3.2"
  port = 6379
  at_rest_encryption_enabled = false # FLAW
  transit_encryption_enabled = true
  auth_token = "${var.auth_token}"
}

resource "aws_elasticache_replication_group" "fail_2" { # Flaw
  automatic_failover_enabled = true
  availability_zones = ["us-west-2a", "us-west-2b"]
  replication_group_id = "tf-rep-group-1"
  replication_group_description = "test description"
  node_type = "cache.m4.large"
  number_cache_clusters = 2
  parameter_group_name = "default.redis3.2"
  port = 6379
  transit_encryption_enabled = true
  auth_token = "${var.auth_token}"
}