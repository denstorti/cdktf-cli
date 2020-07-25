![Build and Push docker image](https://github.com/denstorti/cdktf-cli/workflows/Build%20and%20Push%20docker%20image/badge.svg?event=status)

# Docker Image for cdktf-cli (Terraform CDK)

In order to use cdktf, you'll need Terraform, Node.js, and Yarn. So this docker image intends to make developer's life easier just wrapping cdktf-cli.

Check https://3musketeers.io/.


# Distributions

- DockerHub: https://hub.docker.com/repository/docker/denstorti/cdktf

# Building it

Build:
```
make build
```

Test:
```
make run
```

Push:
```
make push
```
