provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket = "terraform.state.bucket"
    key    = "databases/elasticsearch/cluster.tfstate"
    region = "us-west-2"
  }

  required_version = "0.9.4"
}

module "elasticsearch" {
  source                                 = "./modules/elasticsearch/"
  region                                 = "ap-southeast-2"
  domain_name                            = "afymelasticsearch"
  elasticsearch_version                  = "5.1"
  instance_type                          = "t2.small.elasticsearch"
  instance_count                         = "2"
  dedicated_master_enabled               = "false"
  dedicated_master_type                  = "0"
  dedicated_master_count                 = "0"
  zone_awareness_enabled                 = "false"
  automated_snapshot_start_hour          = "0"
  ebs_enabled                            = "true"
  volume_type                            = "gp2"
  volume_size                            = "10"
  iops                                   = "0"
  rest_action_multi_allow_explicit_index = "true"
  indices_fielddata_cache_size           = ""

  # policy
  access_policies = "${file("${path.module}/data/elastic.policy")}"

  # tags for resource
  tag_name        = "afym.com elasticsearch cluster"
  tag_environment = "${terraform.env}"
  tag_description = "A basic elasticsearch cluster over AWS"
}
