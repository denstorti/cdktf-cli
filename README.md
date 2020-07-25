![Build and Push docker image](https://github.com/denstorti/cdktf-cli/workflows/Build%20and%20Push%20docker%20image/badge.svg?branch=master&event=push)

# Docker Image for cdktf-cli (Terraform CDK)

In order to use cdktf, you'll need Terraform, Node.js, and Yarn. So this docker image intends to make developer's life easier just wrapping cdktf-cli.

Check https://3musketeers.io/.

Image contains:
- Terraform CLI
- cdktf-cli

# Distributions

- DockerHub: https://hub.docker.com/repository/docker/denstorti/cdktf

# Test locally

Test locally using `act`:

```
act -P ubuntu-latest=nektos/act-environments-ubuntu:18.04 -j check_cdktf_releases
```

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
