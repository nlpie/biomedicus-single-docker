
```bash
docker build -t biomedicus-single .
docker run -d -it --name biomedicus --mount type=bind,source="$(pwd)"/input,target=/input --mount type=bind,source="$(pwd)"/output,target=/output biomedicus-single
docker logs biomedicus
```


## Adding your own processors.

1. Add statements to dockerfile to copy over any files needed to run your processors.
2. Modify biomedicus_deploy_config.yml to include your processors.
3. Build and run image as normal
