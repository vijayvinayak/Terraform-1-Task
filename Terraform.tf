# Define your AWS provider
provider "aws" {
  region = "us-west-2"  # Change this to your default region
}

# Define your instances
resource "aws_instance" "instance1" {
  ami           = "ami-002829755fa238bfa"  # Replace with your AMI ID for region 1
  instance_type = "t2.micro"
  tags = {
    Name = "Instance1"
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"  # Change this to your second region
}

resource "aws_instance" "instance2" {
  provider      = aws.us-east-1
  ami           = "ami-051f7e7f6c2f40dc1"  # Replace with your AMI ID for region 2
  instance_type = "t2.micro"
  tags = {
    Name = "Instance2"
  }
}

provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"  # Change this to your third region
}

resource "aws_instance" "instance3" {
  provider      = aws.eu-west-1
  ami           = "ami-057b6e529186a8233"  # Replace with your AMI ID for region 3
  instance_type = "t2.micro"
  tags = {
    Name = "Instance3"
  }
}
