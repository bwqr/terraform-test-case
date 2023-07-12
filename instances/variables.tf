variable "pubkey" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL0M9i/Y+wy5tUIcgZ2NSqz/IMHwZSjvo1BNoiPPlN8lOAK1NUNHpidaIf0KIHLBv4xKjtfhQsp7Nbme5R8RHA9TbsFCiXGFrJBdKy5Zw56rn0wnOiYDOk5rTi3x7squVm7oooP7SIPHiXQWmUsKc70wTT6gwPwLSo3f04aGIpiChE8g0MWnwBc1m+Jdu7Xa7jm5WulBr6iduxtwaVLQf6qjDcc3oR81FJq5T1LKnm0a4zh2YIMZ4zR9gA+ZWPn7Qd34FsgYOTZ+u+fCubuKus4IXzatI1NSSQ8kcDcn/FH7PW15w0TidXgYz1du+/LvmghmbqQ0yci7GyZgY+oyRDOgqcUK6y04JqR93r1TUE1Y2W+z+qcb3pQE+z45bxBLUEJKO1gkRaiskXvD000GuPpB46fCBQxO4IVVP3r9n0MeSAA3Ny6aaS/Z872XKhUkb1+uSiyu7UcYFNkDfVFPCNC1OtHW/UC3mC9+FAvtVJZB2dhqZwsWzC9GmpmgQYPAE= my@email.com"
}

variable "my_ip" {
    default = "159.146.38.132/32"
}

variable "asg_capacity" {
    default = 2
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ami_type" {
    default = "ami-0aea56f3589631913"
}
