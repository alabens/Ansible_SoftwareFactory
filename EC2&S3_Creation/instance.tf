resource "aws_instance" "amazonLinux" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.small"
 

  # the VPC subnet
  subnet_id = aws_subnet.MySubnet-public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.MySecurityGroup.id]

  # the public SSH key
  key_name = "aws"

  # the role 
  iam_instance_profile= "${aws_iam_instance_profile.s3-mybucket-role.name}"
  
  tags= {
      Name= "sprint2_Automated"
}

}







