ARG CUDA=11.0
FROM nvidia/cuda:${CUDA}-devel-ubuntu18.04
LABEL MAINTAINER Arnaud Sevin <Arnaud.Sevin@obspm.fr>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y #&& apt upgrade -y
RUN apt install -y git wget bzip2 pkg-config gfortran make vim doxygen bash-completion libcfitsio-dev libreadline-dev libncurses5-dev libfftw3-dev libgsl-dev libhwloc-dev graphviz dpkg-dev libc6-dev cmake pkg-config libbison-dev libfl-dev libreadline-dev pkg-config gcc-8 g++-8
# RUN apt install -y apt install git make dpkg-dev libc6-dev cmake pkg-config python3-dev libcfitsio-dev pybind11-dev python3-pybind11 libgsl-dev libfftw3-dev libncurses-dev libbison-dev libfl-dev libreadline-dev pkg-config gcc-10 g++-10
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100
RUN apt install -y python3-dev python3-pip
RUN pip3 install cmake pybind11

COPY mkrootdirs.sh .
RUN ./mkrootdirs.sh

ENV HOME=/home/cacao

RUN groupadd -r cacao -f -g 1001
RUN useradd -u 1001 -r -g cacao -d ${HOME} -s /sbin/nologin -c "cacao User" cacao
RUN mkhomedir_helper cacao

COPY .gitconfig ${HOME}

RUN chown -R 1001:1001 ${HOME}
RUN echo 'root:cacao' | chpasswd
RUN echo 'cacao:cacao' | chpasswd

USER 1001

WORKDIR ${HOME}

ENV MILK_VERSION="1.03.00"
ENV MILK_ROOT=/milk
ENV MILK_SHM_DIR=$MILK_ROOT/shm

ENV MILK_INSTALLDIR=${HOME}/local
ENV PATH=${MILK_INSTALLDIR}/milk-${MILK_VERSION}/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=${MILK_INSTALLD}/milk-${MILK_VERSION}/bin:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH=${MILK_INSTALLD}/milk-${MILK_VERSION}/lib/pkgconfig:${PKG_CONFIG_PATH}

# Define environment variable
RUN git clone https://github.com/milk-org/milk.git && \
    cd milk && \
    ./fetch_cacao_dev.sh && \
    ./compile.sh $MILK_INSTALLDIR