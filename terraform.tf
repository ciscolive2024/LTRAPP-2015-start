terraform {

  cloud {
    organization = "ciscolive2024"

    workspaces {
      name = "LTRAPP-2015-99"
    }
  }

  required_providers {
    thousandeyes = {
      source = "thousandeyes/thousandeyes"
      version = "2.0.1"
    }
  }

  required_version = ">= 0.14.0"
}