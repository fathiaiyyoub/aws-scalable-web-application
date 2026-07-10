resource "aws_instance" "red" {
  ami                    = "ami-01066fdebf4814472"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.s3_arr_profile.name

  user_data = file("${path.module}/scripts/user-data-red.sh")

  tags = {
    Name = "Red"
  }
}

resource "aws_instance" "blue" {
  ami                    = "ami-01066fdebf4814472"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_b.id
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.s3_arr_profile.name

  user_data = file("${path.module}/scripts/user-data-blue.sh")

  tags = {
    Name = "Blue"
  }
}