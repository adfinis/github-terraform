provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_orga}"
}

module "repo" {
  source = "./modules/repository"

  repo_list = "${var.repo_list}"
}
