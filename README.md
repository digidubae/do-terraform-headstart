<h1 align="center">
  DO terraform head-start
  <br>
</h1>

## What is this?
A terraform head-start skeleton to get up and running on Digitalocean based on a common architecture:
- A Container registry (to receive your dockeraized app)
- A Managed database
- An App (on app platform)
- A project to contain the above resources

## Prerequisite
- doctl
- Terraform
- Define TF_VAR_do_token and TF_VAR_app_doppler_token in .env file in 2_rest .env file
- define TF_VAR_do_token in 1_registry .env file
- env-cmd
- A Doppler account

Note: The .env files are used to configure terraform parameters.  They are not meant to exist on production environments.

## Steps to build the infrastructure

### 1. Clone this Repo

### 2. Build a Docker Container registry on Digitalocean
```sh
cd 1_registry
```
Create an .env file and define TF_VAR_do_token in it
```sh
TF_VAR_do_token=yOuRDigitalOceanTokenHere
```
Build the container registry
```sh
env-cmd terraform apply
```

### 3. Push your application to the Container Registry
Read the app-example README.md for instructions on how to push your containers.

The app will be automatically re-deployed on every push to the container registry.


### 4. Build the rest of infrastructure
```sh
cd 2_rest
```
Create an .env file and define TF_VAR_do_token in it
```sh
TF_VAR_do_token=yOuRDigitalOceanTokenHere
TF_VAR_app_doppler_token=yOuRDopplerServiceTokenHere
```
Run this shell script to export your public ip address as an environment variable for terraform to pick up during the build.  This is used to allow your current ip address to
access the database which can be very useful for development purposes.
```sh
source ./export-my-public-ip.sh
```

Hint: For every time your public ip address changes, you will need to run the same shell script followed by a terraform apply command.

Build the rest of the infrastructure
```sh
env-cmd terraform apply
```

You will get a useful list of outputs you can use to access the digitalocean console or access your app and database.
```sh
app_console = ...
app_default_ingress = ....
app_live_url = ...
db_console = ...
db_host = ...
db_name = ...
db_password = <sensitive>
db_port = ...
db_user = ...
project_console = ..
```
### Production checklist
- un-comment prevent_destroy in 2_rest/do_db.tf