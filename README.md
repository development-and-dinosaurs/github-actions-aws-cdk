# GitHub Actions AWS CDK

GitHub Action for running the AWS CDK using the JVM.

This action runs commands using the AWS CDK, optimised for JVM languages.

See the [AWS CDK documentation](https://aws.amazon.com/cdk/) for full
information on requirements and prerequisites for using the AWS CDK in your AWS
account.

## Supported Technologies

- Java

Additional technologies can be added as
required. [Raise an issue](https://github.com/development-and-dinosaurs/github-actions-aws-cdk/issues/new).

## Inputs

| Input             | Description                            | Required | Default |
|-------------------|----------------------------------------|----------|---------|
| command           | CDK command to execute                 | true     | n/a     |
| stacks            | Stacks to execute the command against  | true     | n/a     |
| working_directory | Directory to execute CDK commands from | false    | .       |

## Outputs

None.

Need an output in your
workflow? [Raise an issue](https://github.com/development-and-dinosaurs/github-actions-aws-cdk/issues/new).

## Credentials

The AWS CDK requires credentials to perform actions. You must use a separate
action to configure AWS credentials and make them available to this action via
environment variables.

We recommend using
the ["Configure AWS Credentials" Action for GitHub Actions](https://github.com/marketplace/actions/configure-aws-credentials-action-for-github-actions)
for handling credentials, as this supplies numerous secure ways of accessing
credentials, and automatically makes them available for this action to use.

## Examples

### Action

```yaml
- name: ☁️ Deploy CDK
  uses: development-and-dinosaurs/github-actions-aws-cdk@v1
  with:
    command: deploy
    stacks: MyApplication
    working_directory: path/to/my/infrastructure/app
```

### Full Workflow

```yaml
name: 🚀 Deploy CDK App

on:
  push:
    branches:
      - main

permissions:
  id-token: write
  contents: read

jobs:
  deploy:
    name: 🚀 Deploy Application
    runs-on: ubuntu-latest
    steps:
      - name: 🛒 Checkout code
        uses: actions/checkout@v4
      - name: 🔑 Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::123456789:role/my-cdk-deploy-role
      - name: ☁️ Deploy CDK
        uses: development-and-dinosaurs/github-actions-aws-cdk@v1
        with:
          command: deploy
          stacks: MyApplication
          working_directory: path/to/my/infrastructure/app
```
