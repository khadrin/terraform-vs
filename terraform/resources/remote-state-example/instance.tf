resource "aws_instance" "terraform_instance" {
  instance_type = "t2.micro"
  ami           = "ami-f973ab84"
  subnet_id     = "subnet-2156d349"

  tags {
    Name = "terraform_instance"
  }
}
