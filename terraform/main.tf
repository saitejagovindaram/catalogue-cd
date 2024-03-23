module "catalogue" {
  source = "git::https://github.com/saitejagovindaram/roboshop-app-tf-module.git?ref=master"

  ami_id = data.aws_ami.centos8.id
  component = "catalogue"
  environment = "dev"
  project_name = "roboshop"
  component_sg_id = data.aws_ssm_parameter.cart_sg_id.value
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  app_alb_listener_arn = data.aws_ssm_parameter.app_alb_listener_arn.value
  role_priority = 12
  project_version = var.project_version
}