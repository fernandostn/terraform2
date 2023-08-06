variable "image_id" {
  default = "ami-0a3db6a6bb59b68d3"
  type = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

# variável definida para receber os inputs do módulo raiz
variable "servers" {

}

variable "environment" {
  type        = string
  default     = "staging"
  description = "O ambiente da instância"
}

variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro","t3.medium"]
  description = "The list of instance type" 
}

/*variable "blocks" {
  type = list(object({
    device_name = string
    volume_size = string
    volume_type = string
  }))
  description = "List of EBS Block"
}*/

variable "name" {
  type    = string
  default = "Tomás"
  description = "Nome do HelloWorld"
}