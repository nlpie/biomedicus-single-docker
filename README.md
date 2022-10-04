
```bash
docker build -t biomedicus-single .
docker run -d -it --name biomedicus --mount type=bind,source="$(pwd)"/input,target=/input --mount type=bind,source="$(pwd)"/output,target=/output biomedicus-single
docker logs -f biomedicus
```


## Adding your own processors.

1. Add statements to dockerfile to copy over any files needed to run your processors.
2. Modify biomedicus_deploy_config.yml to include your processors.
3. Modify biomedicus_default_pipeline.yml to include your processors.
4. Build and run image as normal

## Issue with Docker Desktop on Mac or Windows

On Docker desktop (Mac & Windows), a VM is used for dockerized applications. This VM has a setting that will kill any network listeners if they are open 5 minutes without communication from outside the VM.

To resolve this issue change the following setting


```json
    "vpnKitMaxPortIdleTime": 0,
```

in the file located at

 - macOS: ``~/Library/Group\ Containers/group.com.docker/settings.json``
 - windows: ``%APPDATA%\Docker\settings.json``

**Important**
BioMedICUS also needs a decent amount of memory. I recommend setting the docker engine memory setting to at least 12GB under Preferences > Resources in the Docker Desktop app. If Docker runs out of memory it will kill random processes which will manifest as service unavailable errors (grpc status 13).
