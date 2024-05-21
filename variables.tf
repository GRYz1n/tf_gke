variable "GOOGLE_PROJECT" {
  type        = string
  default     = ""
  description = "GCP project to use"
}

variable "GOOGLE_REGION" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region to use"
}

# GKE_NUM_NODES