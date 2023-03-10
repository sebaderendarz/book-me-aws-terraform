################################################################################
# General
################################################################################

variable "region" {
  type    = string
  default = "eu-central-1"
}


################################################################################
# VPC
################################################################################

variable "vpc_name" {
  type    = string
  default = "book-me-prod-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_azs" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_database_subnets" {
  type    = list(string)
  default = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
}

variable "vpc_elasticache_subnets" {
  type    = list(string)
  default = ["10.0.31.0/24", "10.0.32.0/24", "10.0.33.0/24"]
}


################################################################################
# VPC Endpoints
################################################################################

variable "vpce_security_group_name" {
  type    = string
  default = "book-me-prod-vpce-sg"
}


################################################################################
# RDS Postgres
################################################################################

variable "rds_db_region" {
  type    = string
  default = "eu-central-1"
}

variable "rds_db_id" {
  type    = string
  default = "book-me-prod-postgresql"
}

variable "rds_master_username" {
  type        = string
  default     = "book_me_prod_admin"
  description = "It is a good practice to stick to lowercase letters, numeric digits and underscores."
}

variable "rds_db_port" {
  type    = number
  default = 5432
}


################################################################################
# Elasticache Redis
################################################################################

variable "redis_db_id" {
  type    = string
  default = "book-me-prod-redis"
}


################################################################################
# ECR for backend image
################################################################################

variable "backend_repository_name" {
  type        = string
  default     = "book-me-prod-backend"
  description = "Name of the ECR repository to store backend app docker images."
}


################################################################################
# S3 bucket to store terraform state, configuration and secrets
################################################################################

variable "config_bucket_name" {
  type        = string
  default     = "book-me-prod-config"
  description = "Name of the S3 bucket to store terraform state, app configuration and secrets."
}


################################################################################
# S3 bucket to store API static and media
################################################################################

variable "static_media_bucket_name" {
  type    = string
  default = "book-me-prod-static-media"
}


################################################################################
# EC2 Bastion
################################################################################

variable "ec2_bastion_name" {
  type    = string
  default = "book-me-prod-bastion"
}

variable "ec2_bastion_instance_type" {
  type    = string
  default = "t2.micro"
}
