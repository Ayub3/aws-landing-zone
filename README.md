# AWS Infrastructure Template

## Purpose

The purpose of this repo is to provide the base configuration to allow people to deploy a resource to AWS with minimal configuration

### Included in this repo:

- Config files with configuration included to deploy to sandpit account
- Github actions to perform: plan, apply and destroy of AWS resources using terraform
- Trivvy scanning of resources in github actions workflows
- Pre-commit hook to perform formatting, validation and creation of documentation for terraform.

## Setup

### Update backend config file

In the [Backend config file](./terraform/config/backend.conf) update the `PROJECT_NAME` in the field `key` to the name of your project
```bash
key = "sandpit-nonprod-state/sandpit/PROJECT_NAME/terraform.tfstate"
```

### Update the variables in tfvars file

In the [variables.tfvars file](./terraform/config/variables.tfvars) update the variables contained within as required:

    - project: Use your project name
    - nonuke: Update to true if your resources should not get deleted

### Add slack workflow secret

In the secrets of the repo that is created from this template there will need to be a secret called `SLACK_WEBHOOK`
This is the webhook of the slack channel a slack bot will post to with updates on deployments from the github actions workflows

## Configure pre-commit-hook

The pre-commit hook defined in the file: [.pre-commit-hook.yaml](./.pre-commit-config.yaml) is defined to perform the operations
`terraform fmt`, `terraform validate` and `terraform-docs` using the [pre-commit-terraform repo](https://github.com/antonbabenko/pre-commit-terraform).

If `terraform-docs` is not run via the console before committing the pre-commit hook will fail and update the `README.md` automatically. When `git commit` is next run the `terraform-docs` hook will pass.  

### Installation
From the root of the repository perform the following commands:

```bash
pip install pre-commit
pre-commit install
```



