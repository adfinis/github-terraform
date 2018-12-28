resource "github_team" "default" {
  count = "${length(var.team_list)}"

  name        = "${lookup(var.team_list[count.index], "name")}"
  description = "${lookup(var.team_list[count.index], "description")}"
  privacy     = "${lookup(var.team_list[count.index], "privacy", "secret")}"
}
