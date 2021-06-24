module "ec2" {
  source = "../modules"
  instance_type= "t2.nano"
  ec2_name ="My_dev_ec2"
}