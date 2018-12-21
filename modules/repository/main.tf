resource "github_repository" "default" {
  count = "${length(var.repo_list)}"

  name = "${lookup(var.repo_list[count.index], "name")}"
}

resource "github_branch_protection" "protect_master" {
  count          = "${length(var.repo_list)}"
  repository     = "${lookup(var.repo_list[count.index], "name")}"
  branch         = "${lookup(var.repo_list[count.index], "protected_branch")}"
  enforce_admins = true
}
