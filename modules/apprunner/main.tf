resource "aws_apprunner_service" "app-runner" {
  service_name = "app-runner-example"

  source_configuration {
    authentication_configuration {
      access_role_arn = var.app_runner_role.arn
    }
    image_repository {
      image_configuration {
        port = "8080"
      }
      image_identifier      = "${var.aws_account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/app-runner-example:latest"
      image_repository_type = "ECR"
    }
  }
}