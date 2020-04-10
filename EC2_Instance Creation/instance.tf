resource "aws_instance" "amazonLinux" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
 

  # the VPC subnet
  subnet_id = "vpc-089fd0bf9d82f2c66"

  # the security group
  vpc_security_group_ids = ["sg-00a5cac71975f122d0"]

  # the public SSH key
  key_name = "aws"
  
  # the role 
  iam_instance_profile= "${aws_iam_instance_profile.s3-mybucket-role.name}"

  
  tags= {
      Name= "task2_Ansible"
}
}
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.amazonLinux.id
}







