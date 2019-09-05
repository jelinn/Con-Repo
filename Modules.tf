module "consumer_ec2_instance_1" {
  source  = "app.terraform.io/jlinn/consumer-ec2-instance-1/aws"
  version = "1.0.0"

  instance_count = 2
  name = "app1"
}

module "consumer_elb_1" {
  source  = "app.terraform.io/jlinn/consumer-elb-1/aws"
  version = "1.0.0"

  environment = "dev"
  instances = module.consumer_ec2_instances.id
  name = "App1-Frontend"
}
