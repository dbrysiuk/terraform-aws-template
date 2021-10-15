variable "bucket_name" {
  description = "Name of bucket you want to create"
}

variable "kms_key" {
  description = "KMS Key Alias used to encrypt the bucket"
  default = "pge-key"
}
variable "force_destroy" {
  description = "Allow bucket destruction even if the bucket has objects"
  default = false
}
variable "versioning" {
  description = "Enable bucket versioning"
  default = false
}
variable "enable_lifecycle" {
  description = "Enable Bucket lifecycle policy"
  type = bool
  default = false
}
variable "expire_after_days" {
  description = "If bucket lifecycle policy is enabled, then the objects inside bucket will be deleted after these many days"
  type = number
  default = 365
}

variable "key_id" {
  description = "Alternative to kms_key mentioned above. KMS Key ID used to ecrypt the bucket. Please provide either this OR kms_key mentioned above."
  default = ""
}