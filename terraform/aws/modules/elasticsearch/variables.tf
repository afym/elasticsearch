variable "region" {
  description = "aws region"
}

# general variables

variable "domain_name" {
  description = "elasticsearch domain name"
}

variable "elasticsearch_version" {
  description = "elasticsearch version value"
}

# nodes variables

variable "instance_type" {
  description = "instance type of data nodes in the cluster"
}

variable "instance_count" {
  description = "number of instances in the cluster"
}

# master variables

variable "dedicated_master_enabled" {
  description = "indicates whether dedicated master nodes are enabled for the cluster"
}

variable "dedicated_master_type" {
  description = "indicates whether dedicated master nodes are enabled for the cluster (3 by default)"
}

variable "dedicated_master_count" {
  description = "number of dedicated master nodes in the cluster (3 by default)"
}

variable "zone_awareness_enabled" {
  description = "indicates whether zone awareness is enabled (if instance_count = 2 * n )"
}

# snapshot

variable "automated_snapshot_start_hour" {
  description = "hour during which the service takes an automated daily snapshot of the indices in the domain."
}

# storage variables

variable "ebs_enabled" {
  description = "whether EBS volumes are attached to data nodes in the domain"
}

variable "volume_type" {
  description = "the type of EBS volumes attached to data nodes."
}

variable "volume_size" {
  description = "the size of EBS volumes attached to data nodes (in GB). Required if ebs_enabled is set to true."
}

variable "iops" {
  description = "the baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type."
}

# access policies

variable "access_policies" {
  description = ""
}

# advance variables

variable "rest_action_multi_allow_explicit_index" {
  description = "https://www.elastic.co/guide/en/elasticsearch/reference/current/url-access-control.html"
}

variable "indices_fielddata_cache_size" {
  description = "https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-fielddata.html"
}

# tags variables

variable "tag_name" {
  description = "tag name for the resource"
}

variable "tag_environment" {
  description = "tag environment for the resource"
}

variable "tag_description" {
  description = "tag description for the resource"
}
