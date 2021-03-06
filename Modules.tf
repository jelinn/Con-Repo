module "consumer_ec2_instance" {
  source  = "app.terraform.io/jlinn/consumer-ec2-instance/aws"
  version = "1.0.1"

  instance_count = 4
  name = "App1"
}

module "consumer_elb" {
  source  = "app.terraform.io/jlinn/consumer-elb/aws"
  version = "1.0.1"

  environment = "dev"
  instances = "${module.consumer_ec2_instance.id}"
  name = "App1"
}
