
module "consumer_ec2_instance_1" {
  source  = "app.terraform.io/JLOrg/consumer-ec2-instance-1/aws"
  version = "1.0.0"

  instance_count = 2
  name = "app1"
}

module "consumer_elb_1" {
  source  = "app.terraform.io/JLOrg/consumer-elb-1/aws"
  version = "1.0.0"

  environment = "dev"
  instances = "${module.consumer_ec2_instance_1.id}"
  name = "app1"
  number_of_instances = 2
}
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.org}-${var.environment}-GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "${var.org}-dynamodb-table-1"
    Environment = "production"
  }
}
