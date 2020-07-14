output "public_subnet_id" {
    value = aws_subnet.public.id
}

output "vpc_id" {
    value = aws_vpc.module_vpc.id
}

output "cidr" {
    value = aws_vpc.module_vpc.cidr_block
}