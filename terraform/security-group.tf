# Verifica se o security group "allow_ssh" já existe
data "aws_security_groups" "existing_allow_ssh" {
  filter {
    name   = "group-name"
    values = ["allow_ssh"]
  }
}

# Cria o grupo apenas se ele não existir
resource "aws_security_group" "allow_ssh" {
  count       = length(data.aws_security_groups.existing_allow_ssh.ids) == 0 ? 1 : 0
  name        = "allow_ssh"
  description = "Permitir ssh"

  ingress {
    description = "SSH para VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# Verifica se o security group "allow_http" já existe
data "aws_security_groups" "existing_allow_http" {
  filter {
    name   = "group-name"
    values = ["allow_http"]
  }
}

# Cria o grupo apenas se ele não existir
resource "aws_security_group" "allow_http" {
  count       = length(data.aws_security_groups.existing_allow_http.ids) == 0 ? 1 : 0
  name        = "allow_http"
  description = "Permitir http"

  ingress {
    description = "HTTP para VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}

# Verifica se o security group "allow_egress" já existe
data "aws_security_groups" "existing_allow_egress" {
  filter {
    name   = "group-name"
    values = ["allow_egress"]
  }
}

# Cria o grupo apenas se ele não existir
resource "aws_security_group" "allow_egress" {
  count       = length(data.aws_security_groups.existing_allow_egress.ids) == 0 ? 1 : 0
  name        = "allow_egress"
  description = "Permitir egress"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_egress"
  }
}
