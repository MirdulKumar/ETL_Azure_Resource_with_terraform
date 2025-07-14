data "terraform_remote_state" "phase1" {
  backend = "local"  
  config = {
    path = "../Phase1/terraform.tfstate"
  }
}