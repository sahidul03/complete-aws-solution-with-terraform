variable "vpc" {
 type = map(any)
}

variable "subnet" {
 type = map(any)
}

variable "azs" {
 type = list(string)
}

variable "public_key" {
 type = string
}
