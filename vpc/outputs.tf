output "id" {
    value = aws_vpc.main.id
}

output "region" {
    value = var.region
}

output "subnet_ids" {
    value = aws_subnet.main.*.id
}
