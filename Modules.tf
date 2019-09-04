module "consumer_ec2_instance" {
  source  = "app.terraform.io/jlinn/consumer-ec2-instance/aws"
  version = "1.0"

  instance_count = 2
  name = "dev"
}

module "consumer_elb" {
  source  = "app.terraform.io/jlinn/consumer-elb/aws"
  version = "1.0"

  environment = "dev"
  instances = "${module.consumer_ec2_instance.id"
  name = "app1-dev"
}
