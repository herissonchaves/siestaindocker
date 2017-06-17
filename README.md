# siesta_in_docker
This is just a simple Dockerfile at the moment built upon ubuntu to run SIESTA.

In order to build the image type:

```bash
docker build -t siesta .
```

Run container

```bash
docker run -it suesta bash
```

this will get you inside the docker container with a precompiled siesta installed in `/opt/siesta-4.1-b2/`

This is a simple build based on gfortran and openmpi.
Use at your own risk! 

This repository is meant to be only as a basic reference install
