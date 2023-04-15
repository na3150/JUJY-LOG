# codecommit repository
resource "aws_codecommit_repository" "jujy_log_repo" {
  repository_name = "${var.env}-${var.repo_name}"
  description     = "created by jujy"
  default_branch  = "main"
}

# use each user's name
data "aws_iam_user" "iam_user" {
  user_name = var.name
}

# codecommit http git credentials
resource "aws_iam_service_specific_credential" "http_cred" {
  service_name = "codecommit.amazonaws.com"
  user_name    = data.aws_iam_user.iam_user.user_name
}

# shell script of git command
resource "null_resource" "git_script" {
    provisioner "local-exec" {
      command = "${path.module}/git.sh" 
    }
}
