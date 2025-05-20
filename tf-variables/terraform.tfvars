instance_type = "t2.micro"
region = "ap-south-1"
ec2-config =  {
    root_volume_size = 20
    root_volume_type = "gp2"
}

additional-tags = {
    "stage" = "Devlopment"

}