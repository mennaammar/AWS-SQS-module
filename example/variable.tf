variable "SQS_name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  type        = map(any)

}
variable "tag_Description" {
  type        = string
  description = "s3 bucket description"

}

variable "tag_Environment" {
  type        = string
  description = "s3 bucket Environment"

}

variable "tag_Project" {
  type        = string
  description = "s3 bucket Project"

}

variable "tag_Owner" {
  type        = string
  description = "s3 bucket Owner"

}

variable "tag_BusinessUnit" {
  type        = string
  description = "s3 bucket BusinessUnit"

}

variable "tag_OpCo" {
  type        = string
  description = "s3 bucket OpCo"

}

variable "tag_Confidentiality" {
  type        = string
  description = "s3 bucket Confidentiality"

}

variable "tag_ServiceLevel" {
  type        = string
  description = "s3 bucket ServiceLevel"

}

variable "tag_SecurityOwner" {
  type        = string
  description = "s3 bucket SecurityOwner"

}

variable "tag_TechnicalOwner" {
  type        = string
  description = "s3 bucket TechnicalOwner"

}

variable "tag_Source" {
  type        = string
  description = "s3 bucket Source"

}
