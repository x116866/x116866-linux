terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.48.0"
    }
  }
}

provider "google" { 
    project     = "kcluser4" 
    region      = "us-west1" 
    zone        = "us-west1-a" 
    credentials = "C:/Users/videl/Desktop/terraform/serviceaccounts.json"
}

terraform {
  backend "gcs" {
    bucket = "bucket1witheng"   # same name you created above
    prefix = "terraform/state"
    credentials = "serviceaccounts.json"
                            
  }
}

variable "vm_name" {
  type        = string
  description = "Name of the VM instance"
  default     = "demovm"      # optional default
}
