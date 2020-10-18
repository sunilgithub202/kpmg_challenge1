# Create EC2 instances for webservers
resource "aws_key_pair" "ssh-key" {
  key_name   = "pemfile"
  # Adding the SSH authorized key !
  public_key = file("~/.ssh/id_rsa.pub")

}

resource "aws_instance" "webservers" {
  count           = length(var.web_subnets_cidr_blocks)
  ami             = var.web_ami
  key_name 	  = "pemfile"
  instance_type   = var.web_instance
  security_groups = [aws_security_group.webserver_sg.id]
  subnet_id       = element(aws_subnet.web.*.id,count.index)

  tags =  {
    Name = element(var.webserver_name,count.index)
  }
}
