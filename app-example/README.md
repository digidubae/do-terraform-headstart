## Create .env file
```sh
PRD_DOPPLER_TOKEN=yOuR.Prd.dOppLeRtOkEn
DEV_DOPPLER_TOKEN=yOuR.Dev.dOppLeRtOkEn
DOPPLER_PROJECT_NAME=doppler_project_name
DOPPLER_DEV_CONF_NAME=doppler_dev_env_name
DOPPLER_PRD_CONF_NAME=doppler_prd_env_name
CONTAINER_REGISTRY_NAME=container_registry_name
APP_NAME=app_name
```

## Develop locally
```sh
deno task dev
```
Note: in some OS types, deno gives the following error:
***error: Function not implemented (os error 38)***
If you face this error, remove the --watch from dev_cmd in deno.json

## Build your container
```sh
deno task build-container
```

## Run your container locally
```sh
deno task run-container-locally
```

## Push container to digitalocean registry
```sh
deno task tag-container
deno task push-container
```

If you face "unauthorized: authentication required" error:
```sh
doctl registry login
```