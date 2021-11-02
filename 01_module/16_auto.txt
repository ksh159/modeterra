resource "aws_ami_from_instance" "ksh_ami" {
    name                = "ksh-ami"
    source_instance_id  = aws_instance.ksh_weba.id  
}