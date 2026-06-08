# Infrastructure / Platform Checks

Use this if an infrastructure or platform repo needs validation commands or a GitLab pipeline.

## Typical Commands

- format checks
- static validation
- plan or preview output

## Example Commands

```sh
terraform fmt -check
terraform validate
terraform plan -out=tfplan
```

or

```sh
pulumi preview
helm lint charts/my-app
```

Usually I keep apply or deploy steps separate from validation.
