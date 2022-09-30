
```bash
docker build -t biomedicus-single .
docker run -d -it --name biomedicus --mount type=bind,source="$(pwd)"/input,target=/input --mount type=bind,source="$(pwd)"/output,target=/output biomedicus-single
docker logs biomedicus
```
