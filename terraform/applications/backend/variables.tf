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

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
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

variable "rds_db_name" {
  type        = string
  default     = "book_me_prod"
  description = "It is a good practice to stick to lowercase letters, numeric digits and underscores."
}

variable "rds_db_username" {
  type        = string
  default     = "book_me_admin"
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
# ALB
################################################################################

variable "alb_id" {
  type    = string
  default = "book-me-prod-alb"
}

variable "acm_domain_name" {
  type    = string
  default = "terraform.bookme.tk"
}

variable "route53_zone_id" {
  type = string
  # TODO Remove the default value
  default     = "Z02587991HESUSK03JP5P"
  description = "ID of the existing Route53 hosted zone."
}

variable "alb_api_target_group_stickiness_duration" {
  type    = number
  default = 60
}


################################################################################
# S3 bucket to store API static and media
################################################################################

variable "static_media_bucket_name" {
  type    = string
  default = "book-me-prod-static-media"
}


################################################################################
# VPC Endpoints
################################################################################

variable "vpce_security_group_name" {
  type    = string
  default = "book-me-prod-vpce-sg"
}


################################################################################
# ECS
################################################################################

variable "ecs_cluster_id" {
  type    = string
  default = "book-me-prod-ecs-cluster"
}

variable "api_service_name" {
  type    = string
  default = "book-me-prod-api"
}

variable "api_task_image" {
  type        = string
  default     = "crccheck/hello-world:latest"
  description = "Ultimately it should be the task image stored in ECR repository."
}

variable "api_task_cmd" {
  type    = list(string)
  default = ["sh", "-c", "daphne --bind 0.0.0.0 core.asgi:application && python manage.py runworker -v2"]
}

variable "api_service_cpu" {
  type    = number
  default = 256
}

variable "api_service_memory" {
  type    = number
  default = 512
}

variable "api_config_bucket_name" {
  type        = string
  default     = "book-me-config"
  description = "Name of the s3 bucket where file with api service settings and secrets resides."
}

variable "api_config_file_path" {
  type        = string
  default     = "/config/api/production.env"
  description = "Path to the file with api service settings and secrets in the config s3 bucket."
  # TODO add validation -> min length 5 (/.env), starts with "/", ends with ".env"
}
