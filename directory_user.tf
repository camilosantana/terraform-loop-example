##### users.tf
locals {
  user_directory = {
    aseward = {
      email    = "andrew@company.com"
      name     = "andrew seward"
      org_role = "member" // `admin` or default:`member` recommend lookup(local.directory.andrew, "org_role", "member")
      ### below superseded by ./directory_team.tf
      #   teams = [           // may need this to be another map with team_name and role (member or maintainer)
      #     "teamA",
      #     "name with spaces",
      #     "team_with_underscores",
      #     "tm-hyphenated"
      #   ] // note: no team name starts w/ int
    },
  }
}
