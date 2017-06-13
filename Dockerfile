FROM ubuntu:14.04.5
# siesta + mpi built on ubuntu 14.04.5

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget vim gfortran\
                    openmpi-common openmpi-bin \
                    libopenmpi-dev libblacs-mpi-dev \
                    libopenmpi1.6 libnetcdf-dev \
                    netcdf-bin libblas-dev liblapack-dev make ssh -y

WORKDIR /opt

# Get siesta source and scalapack source
RUN wget https://launchpad.net/siesta/4.1/4.1-b2/+download/siesta-4.1-b2.tar.gz
RUN tar -xzvf siesta-4.1-b2.tar.gz
RUN wget http://www.netlib.org/scalapack/scalapack-2.0.2.tgz
RUN tar -xzvf scalapack-2.0.2.tgz 

# build and install scalapack
WORKDIR /opt/scalapack-2.0.2
RUN cp SLmake.inc.example SLmake.inc
RUN make lib
RUN cp libscalapack.a /usr/lib/
# build and install siesta
WORKDIR /opt/siesta-4.1-b2/Obj
RUN sh ../Src/obj_setup.sh
ADD arch.make ./
RUN make

WORKDIR /opt






