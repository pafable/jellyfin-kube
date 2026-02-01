variable "app_version" {
  description = "Application version"
  type = object({
    version = string
  })
  default = { version = "blue" }
}

variable "config_path" {
  description = "Kubernetes config path"
  type        = string
}

variable "config_context" {
  description = "Kubernetes config context"
  type        = string
}

variable "container_image" {
  description = "jellyfin container image"
  type        = string
  default     = "docker.io/jellyfin/jellyfin:10.11.6"
}

variable "controller_ips" {
  description = "IP addresses of controllers"
  type        = list(string)
  default     = []
}

variable "cpu_request" {
  description = "CPU request"
  type        = string
  default     = "100m"
}

variable "domain" {
  description = "Domain"
  type        = string
}

variable "gateway_class_name" {
  description = "Gateway class name"
  type        = string
  default     = "door"
}

variable "jellyfin_cache_path" {
  description = "Jellyfin cache path"
  type        = string
}

variable "jellyfin_config_path" {
  description = "Jellyfin config path"
  type        = string
}

variable "jellyfin_media_path" {
  description = "Jellyfin media path"
  type        = string
}

variable "memory_request" {
  description = "Memory request"
  type        = string
  default     = "1.0Gi"
}

variable "namespace" {
  description = "Jellyfin namespace"
  type        = string
  default     = "jellyfin"
}

variable "nfs_ipv4" {
  description = "IP address of NFS server for storage backend"
  type        = string
}

variable "node_name" {
  description = "Kubernetes node to deploy on"
  type        = string
}

variable "owner" {
  description = "App owner"
  type        = string
  default     = "devops"
}

variable "replicas" {
  description = "Number of replicas"
  type        = number
  default     = 1
}

variable "storage_class_name" {
  description = "Storage class name"
  type        = string
  default     = "local-path"
}
