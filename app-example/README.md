## Create .env file
Note: This .env file is used to run and build locally.  It is not meant to exist on production environments.

```sh
DEV_DOPPLER_TOKEN=yOuR.Dev.dOppLeRtOkEn
DOPPLER_PROJECT_NAME=doppler_project_name
DOPPLER_DEV_CONF_NAME=doppler_dev_env_name
DOPPLER_PRD_CONF_NAME=doppler_prd_env_name
```

## Develop locally
```sh
deno task dev
```

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
docker tag app-example registry.digitalocean.com/container-registry-9283987/app-example
docker push registry.digitalocean.com/container-registry-9283987/app-example
```

If you face "unauthorized: authentication required" error:
```sh
doctl registry login
```