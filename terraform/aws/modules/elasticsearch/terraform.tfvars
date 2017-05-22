region = "ap-southeast-2"

domain_name = "afym.com"

elasticsearch_version = "1.5"

# nodes variables

instance_type = "t2.small.elasticsearch"

instance_count = "3"

# master variables

dedicated_master_enabled = "false"

dedicated_master_type = "t2.small.elasticsearch"

dedicated_master_count = "3"

zone_awareness_enabled = "false"

# snapshot

automated_snapshot_start_hour = "00:00 UTC"

# storage variables

ebs_enabled = "true"

volume_type = "gp2"

volume_size = "10"

iops = "1000"

# access policies

access_policies = ""

# advance variables

rest_action_multi_allow_explicit_index = "true"

indices_fielddata_cache_size = ""
