# Summary

Goal: IAC github. Focus on easy maintenance.

## Usage

Proof-of-concept for writing up tf that is easy for dev-enablement and IT to manage and users to submit PRs that aren't normally familiar with terraform.

```bash
terraform init && terraform apply --auto-approve
less output.text
```

### Points of Administration

Ownership is limited to files that reflect company directory

- `directory_team.tf`
- `directory_users.tf`

Ideally, these would be populated with data pulled from [WorkDay].

## Importing existing resources

This will be a challenge no matter what but we could parse the unique string indices that are already there when using `for_each` loops. The `tfstate` file should have them. We can match what's pulled from the API and run through that table to `terraform import 'resource.instance["index"]' <github_resource_identifier>` the resources.

[WorkDay]: https://www.myworkday.com/***REMOVED***
