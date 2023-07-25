provider "aws"{
region ="ap-south-1"
access_key = "AKIAZPAASVDFVQXOSM5A"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-006935d9a6773e4ec"
instance_type = "t2.micro"
key_name = "terra_proj"
vpc_security_group_ids = [aws_security_group.three.id] 
availability_zone = "ap-south-1a"
user_data	= <<EOF

#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hi all this is website created by terraform infra by me server-1" > /var/www/html/index.html
EOF
Tags = {
Name = "swiggy-01"
}
}

resource "aws_instance" "two" {
ami = "ami-006935d9a6773e4ec"
instance_type = "t2.micro"
key_name = "terra_proj"
vpc_security_group_ids = [aws_security_group.three.id]
availability_zone = "ap-south-1a"
user_data       = <<EOF

#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hi all this is website created by terraform infra by me server-2" > /var/www/html/index.html
EOF
Tags = {
Name = "swiggy-02"
}
}


