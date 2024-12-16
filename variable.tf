variable "ami" {
  description = "this is ami value"
}
variable "instance_type" {
  description = "this is instance type"
}

variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  #default     = true
}

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
 # default     = ["user1", "user2", "user3s"]
