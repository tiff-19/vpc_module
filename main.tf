resource "aws_vpc" "module_vpc"{
    cidr_block              = var.AWS_CIDR
    enable_dns_hostnames    = var.ENABLE_DNS_HOSTNAMES
    enable_dns_support      = var.ENABLE_DNS_SUPPORT
    tags = {
        Name = var.AWS_VPC_NAME
    }
}

resource "aws_internet_gateway" "module_gw"{
    vpc_id         = aws_vpc.module_vpc.id
    tags = {
        Name = "${var.AWS_VPC_NAME}-igw"
    }
}

resource "aws_route" "internet_access" {
    route_table_id              = aws_vpc.module_vpc.main_route_table_id
    destination_cidr_block      = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.module_gw.id
}

resource "aws_subnet" "public" {
    vpc_id                      = aws_vpc.module_vpc.id
    cidr_block                  = var.PUBLIC_SUBNET
    tags = {
        Name = "${var.AWS_VPC_NAME}-public"
    }
}