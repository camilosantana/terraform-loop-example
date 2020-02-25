##### teams
// may need a function to parse org for teams and return team_name = {slug="string"}
// and merge() into below if the team declaration is not in terraform
// https://developer.github.com/v3/teams/?#list-teams

## Single point of Administration for teams and members
locals {
  team_directory = {

    party-data-model = {
      description = "The Data Model (Party/Person/Organization)"
      privacy     = "closed" // "closed" would be best a default when this is consumed
      slug        = "string"
      user_role = {
        aseward = "maintainer"
        bseward = "member"
        cseward = "member"
      }
    },
    cs_documentation_read = {
      name        = "sc-docx-read"
      description = ""
      privacy     = "closed"
      user_role = {
        aseward = "maintainer"
        bseward = "member"
        cseward = "member"
      }

    },
    cs_documentation_write = {
      name        = "sc-docx-write"
      description = ""
      privacy     = "closed"
      user_role = {
      }
    },
  }
}
