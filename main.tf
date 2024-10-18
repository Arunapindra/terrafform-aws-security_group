resource "aws_security_group" "main" {
  name        = local.final_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
      Name = local.final_sg_name
  })
}


resource "aws_security_group" "sg_egress" {

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}