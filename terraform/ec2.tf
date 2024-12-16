resource "aws_instance" "amb-prod-2" {
  ami             = "ami-0e2c8caa4b6378d8c"
  instance_type   = "t2.micro"
  security_groups = ["allow_http", "allow_ssh", "allow_egress"]
  user_data       = file("script.sh")

  tags = {
    Name = "amb-prod"
  }
}
