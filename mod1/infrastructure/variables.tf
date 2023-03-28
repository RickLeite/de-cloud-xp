variable "base_bucket_name" {
  description = "Base name for the bucket"
  type        = string
  default     = "datalake-igti-edc-tf"

}

variable "ambiente" {
  description = "Ambiente do bucket"
  type        = string
  default     = "producao"

}

variable "numero_conta" {
  description = "Numero da conta"
  type        = string
  default     = "909382555602"

}
