variable "GOOGLE_PROJECT" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "GOOGLE_REGION" {
  description = "Google Cloud region"
  type        = string
}

variable "GKE_NUM_NODES" {
  description = "Number of nodes in the GKE node pool"
  type        = number
  default     = 1
}

variable "GKE_MACHINE_TYPE" {
  description = "Machine type for the GKE nodes"
  type        = string
  default     = "e2-medium"
}
