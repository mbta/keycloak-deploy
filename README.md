# keycloak-deploy

These scripts do the following:

- create a Docker image to run Keycloak (based on the `jboss/keycloak` image)
- upload that image to AWS Elastic Container Service
- deploy an environmment using that image to AWS Elastic Beanstalk

## Usage

```
$ semaphore/build_push.sh dev
$ semaphore/deploy.sh dev
```

## Requirements

- an RDS PostgreSQL database, configured with a user accessible with IAM access

### RDS configuration

To create an IAM user, run the following in the database:

```
create user USER with login;
grant rds_iam to USER;
grant connect on database DATABASE_NAME to USER;
grant usage on schema public to USER;
alter default privileges in schema public grant all privileges on tables to USER;
alter default privileges in schema public grant all privileges on sequences to USER;
```

## Configuration

The following environment variables should be configured locally, in order to deploy to Elastic Beanstalk:

- `APP` - the Elastic Beanstalk application
- `DOCKER_REPO` - the Elastic Container Service Docker repository
- `S3_BUCKET_NAME` - the S3 bucket to which Elastic Beanstalk versions are uploaded

The following environment variables should be configured in the Elastic Beanstalk environment:

- `DB_REGION` - the region the database server is running in
- `DB_NAME` - the name of the database
- `DB_ADDR` - the hostname of the database server
- `DB_PORT` - the port of the database server
- `DB_USER` - the username for the database
- `KEYCLOAK_HOSTNAME` - the public hostname for Keycloak
- `KEYCLOAK_ADMIN_USER_SECRET` - an AWS Secrets Manager secret with the
  username/password for the default admin user

## TODOs

- [] have the load balancer connect to Nginx over TLS
- [] test that multiple instances connect via the database appropriately

## Kudos

Thank you to
[dasniko/keycloak-docker-aws](https://github.com/dasniko/keycloak-docker-aws)
for help with the JDBC_PING adapter and getting data from AWS Secrets Manager.
