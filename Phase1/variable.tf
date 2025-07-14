variable "location" {
  default = "West US"
}

variable "resource_group_name" {
  default = "Mirdul_Resource_Group"
}

variable "storage_account_name" {
  default = "mkadlszen2tf2"
}

variable "adf_name" {
  default = "tf-adf01"
}

variable "databricks_workspace_name" {
  default = "tfDatabricks-ws01"
}

variable "subscription_id" {
  description = "Azure subcription id"
  type        = string
  default     = "XXXXXXXX"  # Optional
}


variable "tenant" {
  description = "Subscription tenant value"
  type = string
  default = "XXXXXXXX"
}



