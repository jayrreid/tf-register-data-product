//--------------------------------------------------------------------
// Variables
variable "region" {
  default = "us-east-1"
}

variable "datalake_abbreviation" {
  default = "3740"
}

variable "s3bucket_name" {
  default = "lf-datalake-${var.datalake_abbreviation}"
}
