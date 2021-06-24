module "ec2" {
  source = "../modules"
  instance_type= "t2.large"
  ec2_name ="My_prod_ec2"
}