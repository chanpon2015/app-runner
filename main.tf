module "ecr" {
  source         = "./modules/ecr"
  region         = var.region
  aws_account_id = var.aws_account_id
}

module "role" {
  source = "./modules/role"
}

module "apprunner" {
  source          = "./modules/apprunner"
  app_runner_role = module.role.app_runner_role
  aws_account_id  = var.aws_account_id
  ecr_repository  = module.ecr.ecr_repository

  depends_on = [
    module.ecr,
    module.role
  ]
}