resource "aws_ecr_repository" "ecr_repository" {
  name         = "app-runner-example"
  force_delete = true
}

resource "null_resource" "ecr_push" {
  triggers = {
    file_content_md5 = md5(file("./example/ecr_push.sh"))
  }

  provisioner "local-exec" {
    command = "sh ./example/ecr_push.sh"

    environment = {
      REGION         = var.region
      AWS_ACCOUNT_ID = var.aws_account_id
      REPOSITORY_URL = aws_ecr_repository.ecr_repository.repository_url
      CONTAINER_NAME = "app-runner-example"
    }
  }
}