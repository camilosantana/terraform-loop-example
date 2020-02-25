resource "null_resource" "resource_github_membership" {
  for_each = local.user_directory

  provisioner "local-exec" {
    command = <<HEREDOC
    printf 'resource_github_membership
    \tusername = ${each.key}
    \trole = ${each.value.org_role}\n\n' >> ${var.output_file}
    HEREDOC
  }
  triggers = {
    build_number = timestamp()
  }

}
