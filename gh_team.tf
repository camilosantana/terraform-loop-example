## generate github team memberships
locals {
  team_user_role = toset(flatten([
    for teams_all in keys(local.team_directory) : distinct([
      for user, role in lookup(lookup(local.team_directory, teams_all), "user_role") : {
        team = teams_all
        user = user
        role = role
      }
    ])
  ]))
}

// setproduct(keys(local.directory),toset(local.directory.andy.teams))
resource "null_resource" "resource_github_team" {
  for_each = local.team_directory

  provisioner "local-exec" {
    command = <<HEREDOC
    printf 'resource_github_team
    \tname = ${each.key}
    \tdescription = ${each.value.description}
    \tprivacy = ${each.value.privacy}\n\n' >> ${var.output_file}
    HEREDOC
  }
  triggers = {
    build_number = timestamp()
  }

}

resource "null_resource" "resource_github_team_membership" {
  // transform the tuple into a map to make it compatible with for_each
  // concatenating all values to make a unique identifier for each resource instance
  for_each = {
    for e in local.team_user_role : "${e.team}-${e.role}-${e.user}" => e
  }

  provisioner "local-exec" {
    // here we need a nested loop. iterate over each.key and loop through each.key.members
    // solution might be here https://stackoverflow.com/questions/56047306/terraform-0-12-nested-for-loops
    command = <<HEREDOC
    printf 'resource_github_team_membership
    \tteam_id  = ${each.value.role}
    \tusername = ${each.value.team}
    \trole     = ${each.value.user}\n\n' >> ${var.output_file}
    HEREDOC
  }
  triggers = {
    build_number = timestamp()
  }
}
