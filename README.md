# Keycloak Deploy

Assets, customizations and tooling to build and deploy Keycloak containers to ECS.

## Testing locally

You can use the container locally for testing with Docker Compose:

```bash
$ docker compose up
$ open http://localhost:8080/
```

## Building &amp; Deploying

This repo contains GitHub Actions workflows for:

- Building a Docker container image whenever a git tag is created
- Deploying to Keycloak Dev whenever changes are merged to the main branch
- Deploying pre-existing tags to Keycloak Prod

These workflows are designed to support the following code deployment process:

1. Propose changes in a pull request and have them reviwed.
1. When the pull request is approved, merge it into the main branch. This will automatically trigger the [Deploy Keycloak Dev](https://github.com/mbta/keycloak-deploy/actions/workflows/deploy-dev.yml) workflow.
1. Confirm that Keycloak Dev is in a good state after the deploy.
1. [Create a new Release](https://github.com/mbta/keycloak-deploy/releases) in GitHub. In the release creation form:
   - Create a new tag for the release. The tag should start with the letter `v` and use [semantic versioning](https://semver.org/), e.g. `v1.0.3`.
   - Set the release title to match the tag
   - In the release description, note the changes that are part of this release
   When the release is created, the [Build Container Image](https://github.com/mbta/keycloak-deploy/actions/workflows/build-image.yml) workflow will run automatically to build an image with the corresponding tag and push it to ECR.
1. Deploy to production by running the [Deploy Keycloak Prod](https://github.com/mbta/keycloak-deploy/actions/workflows/deploy-prod.yml) workflow, passing the newly created tag.

### Required Environment Variables

The GitHub Actions workflows require the following variables to be set in the "Secrets" section of the repo settings:

- `AWS_ACCESS_KEY_ID` - AWS access key for ECS API calls
- `AWS_SECRET_ACCESS_KEY` - AWS access key for ECS API calls
- `DOCKER_REPO` - Elastic Container Registry repo URI
- `DOCKER_USERNAME` - Docker Hub credentials for pulling base images
- `DOCKER_PASSWORD` - Docker Hub credentials for pulling base images
- `SLACK_WEBHOOK` - Slack webhook URL for posting deploy status on completion

## Keycloak Infrastructure

Keycloak ECS infrastructure is managed by Terraform, using the Keycloak Terraform module maintained in the [terraform-keycloak-sso repo](https://github.com/mbta/terraform-keycloak-sso/).

## Maintainers

- [Integsoft](https://www.integsoft.com/home.html)
- [MBTA Customer Technology](https://ctd.mbta.com/)
