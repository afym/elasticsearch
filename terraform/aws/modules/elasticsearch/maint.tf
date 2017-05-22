provider "aws" {
  region = "${var.region}"
}

resource "aws_elasticsearch_domain" "aws_elasticsearch_cluster" {
  domain_name           = "${var.domain_name}"
  elasticsearch_version = "${var.elasticsearch_version}"

  cluster_config {
    instance_type            = "${var.instance_type}"
    instance_count           = "${var.instance_count}"
    dedicated_master_enabled = "${var.dedicated_master_enabled}"
    dedicated_master_type    = "${var.dedicated_master_type}"
    dedicated_master_count   = "${var.dedicated_master_count}"
    zone_awareness_enabled   = "${var.zone_awareness_enabled}"
  }

  ebs_options {
    ebs_enabled = "${var.ebs_enabled}"
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
    iops        = "${var.iops}"
  }

  snapshot_options {
    automated_snapshot_start_hour = "${var.automated_snapshot_start_hour}"
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "${var.rest_action_multi_allow_explicit_index}"
    "indices.fielddata.cache.size"           = "${var.indices_fielddata_cache_size}"
  }

  access_policies = "${var.access_policies}"

  tags {
    Name        = "${var.tag_name}"
    Environment = "${var.tag_environment}"
    Description = "${var.tag_description}"
  }
}
