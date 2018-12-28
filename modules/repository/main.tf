resource "github_repository" "default" {
  count = "${length(var.repo_list)}"

  name          = "${lookup(var.repo_list[count.index], "name")}"
  private       = "${lookup(var.repo_list[count.index], "private")}"
  description   = "${lookup(var.repo_list[count.index], "description")}"
  has_wiki      = "${lookup(var.repo_list[count.index], "has_wiki")}"
  has_downloads = "${lookup(var.repo_list[count.index], "has_downloads")}"
  has_issues    = "${lookup(var.repo_list[count.index], "has_issues")}"
}

resource "github_branch_protection" "protect_master" {
  count          = "${length(var.repo_list)}"
  repository     = "${lookup(var.repo_list[count.index], "name")}"
  branch         = "${lookup(var.repo_list[count.index], "protected_branch")}"
  enforce_admins = true
}

module "team" {
  source    = "../team"
  team_list = "${var.team_list}"
}

resource "github_team_repository" "default" {
  count = "${length(var.repo_list)}"

  team_id    = "${module.team.employee_team_id}"
  repository = "${lookup(var.repo_list[count.index], "name")}"
  permission = "admin"
}
