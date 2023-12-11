<h1 align="center">
  DO terraform head-start
  <br>
</h1>

## What is this?
A terraform head-start skeleton to get up and running on Digitalocean based on a common architecture:
- A Container registry (to receive your dockeraized app)
- A Managed database
- An App (on app platform)
- A project to contain the above resource
- An integration with Doppler secret management

## Prerequisite
- [digitalocean account](https://digitalocean.com)
- [doctl](https://docs.digitalocean.com/reference/doctl/how-to/install/)
- [Terraform cloud account](https://www.hashicorp.com/products/terraform)
- Terraform cloud organization, and two workspaces (named exactly as container_registry and infra).  You can leave the default project.
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [npm](https://www.npmjs.com/package/n#installation)
- env-cmd: **npm i -global env-cmd**
- [Doppler account](https://doppler.com)
- A Doppler project and two configs (one for development and one for production)
- [Doppler cli](https://docs.doppler.com/docs/install-cli)
## Steps to build the infrastructure

### 1. Clone this Repo
```sh
git clone https://github.com/digidubae/do-terraform-headstart.git
```

*Make the code yours and maintain it in your own repo*

```sh
git remote set-url origin https://github.com/../...git
```

### 2. Build a Docker Container registry on Digitalocean
```sh
cd 1_registry
```
Update your organization under the cloud block in **main.tf** (this has to be hardcoded instead of picking up from a variable as you cannot use variables in the cloud block)

login and init terraform:
```sh
terraform login
terraform init
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
Explore the /app-example to learn the workflow of dockerizing and pushing your app container to the registry you just created.

Once you push your app to the container registry, you are ready to build the rest of the infrastructure 

### 4. Build the rest of infrastructure
```sh
cd 2_rest
```
Update your organization name under the cloud block in **main.tf** (this has to be hardcoded instead of picking up from a variable as you cannot use variables in the cloud block)

Also, update do_app_name and do_repo_name to match your APP_NAME from the app-example .env file

init terraform:
```sh
terraform init
```

Create an .env file and define following in it
```sh
TF_VAR_do_token=yOuRDigitalOceanTokenHere
TF_VAR_app_doppler_token=yOuR.Prd.DopplerService.TokenHere
TF_VAR_app_doppler_project_name=doppler-project-name
TF_VAR_app_doppler_prd_conf_name=doppler-project-config-name
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