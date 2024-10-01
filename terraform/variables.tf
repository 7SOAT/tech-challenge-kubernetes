variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
    description = "CIDR block da VPC principal."
}

variable "availability_zones" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
    type = list(string)
    default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "aws_iam_labrole_arn" {
    type = string
    description = "ARN do role "
}

variable "eks_nodes_port" {
    type = number
    default = 30564
}

variable "aws_rds_username" {
    type = string
    description = "RDS DB Instance username."
}

variable "aws_rds_password" {
    type = string
    description = "RDS DB Instance password."
}

variable "aws_rds_dbname" {
    type = string
    description = "RDS DB Instance database name."
}

variable "tech_challenge_api_port" {
    type = number
    default = 4000
}