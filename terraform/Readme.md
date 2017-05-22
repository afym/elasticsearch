## Elasticsearch terraform module

#### Important (*) Setting up the local environment

```
# Change your bucket an region in aws/main.tf
# Change the <account-id> in data/elastic.policy
# Change the variables in the module
```

#### Deploying the infrastructure

```
$ cd terraform/aws
# Set a the infrastructure state
$ terraform init
# Listing the environments
$ terraform env list
# Creating a new environment
$ terraform env new stage
# Switching environments
$ terraform env select stage
# Force module update (just in case)
$ terraform get -update=true
# To kill the cluster
$ terraform destroy
```

#### Elasticsearch variables values

| Variable         | Values                        |
| ---------------- |:-----------------------------:|
| volume_type      | gp2 , io1, standard|
| elasticsearch_version | 5.1, 2.3, 1.5|

#### Some points to consider

* You set iops value when you are using io1 in *volumen_type*
* If you want to dedicated_master_enabled set it in true, dedicated_master_type with some instance type and dedicated_master_count = 3 (recommended)
* If you want to use zone_awareness_enabled make sure your nodes are a 2*n value
* In most cases set the advance options as default

#### Elasticsearch instances (master and nodes)

* t2.small.elasticsearch
* t2.medium.elasticsearch
* c4.large.elasticsearch
* c4.xlarge.elasticsearch
* c4.2xlarge.elasticsearch
* c4.4xlarge.elasticsearch
* c4.8xlarge.elasticsearch
* m3.medium.elasticsearch
* m3.large.elasticsearch
* m3.xlarge.elasticsearch
* m3.2xlarge.elasticsearch
* m4.large.elasticsearch
* m4.xlarge.elasticsearch
* m4.2xlarge.elasticsearch
* m4.4xlarge.elasticsearch
* m4.10xlarge.elasticsearch
* r3.large.elasticsearch
* r3.xlarge.elasticsearch
* r3.2xlarge.elasticsearch
* r3.4xlarge.elasticsearch
* r3.8xlarge.elasticsearch
* r4.large.elasticsearch
* r4.xlarge.elasticsearch
* r4.2xlarge.elasticsearch
* r4.4xlarge.elasticsearch
* r4.8xlarge.elasticsearch
* r4.16xlarge.elasticsearch
* i2.xlarge.elasticsearch
* i2.2xlarge.elasticsearch

#### Backup time values

* 0  => 00:00 UTC
* 1  => 01:00 UTC
* 2  => 02:00 UTC
* 3  => 03:00 UTC
* 4  => 04:00 UTC
* 5  => 05:00 UTC
* 6  => 06:00 UTC
* 7  => 07:00 UTC
* 8  => 08:00 UTC
* 9  => 09:00 UTC
* 10 => 10:00 UTC
* 11 => 11:00 UTC
* 12 => 12:00 UTC
* 13 => 13:00 UTC
* 14 => 14:00 UTC
* 15 => 15:00 UTC
* 16 => 16:00 UTC
* 17 => 17:00 UTC
* 18 => 18:00 UTC
* 19 => 19:00 UTC
* 20 => 20:00 UTC
* 21 => 21:00 UTC
* 22 => 22:00 UTC
* 23 => 23:00 UTC

#### Some pictures

![terraform-running](pictures/terraform-running.jpeg?raw=true "terraform apply")

![creating-cluster](pictures/creating-cluster.jpeg?raw=true "on aws web console")

![cluster-done](pictures/cluster-done.jpeg?raw=true "cluster done")

![cluster-done](pictures/cluster-done.jpeg?raw=true "cluster done")

![terraform-state](pictures/terraform-state.jpeg?raw=true "terraform state s3")

![terraform-tfstate](pictures/terraform-tfstate.jpeg?raw=true "terraform state s3 object")

#### More information in:

[Terraform elasticsearch](https://www.terraform.io/docs/providers/aws/r/elasticsearch_domain.html)
