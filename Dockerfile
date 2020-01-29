FROM debian:latest

RUN apt update
RUN apt install -y git wget tar

RUN mkdir -p /opt/riscv
WORKDIR /opt/riscv

RUN git clone --recursive https://github.com/sifive/freedom-e-sdk.git

RUN mkdir -p downloads
RUN cd downloads && wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz
RUN cd downloads && wget https://static.dev.sifive.com/dev-tools/riscv-openocd-0.10.0-2019.08.2-x86_64-linux-ubuntu14.tar.gz
RUN cd downloads && wget https://static.dev.sifive.com/dev-tools/riscv-qemu-4.1.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz

RUN cd downloads && tar -xvf riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz
RUN cd downloads && tar -xvf riscv-openocd-0.10.0-2019.08.2-x86_64-linux-ubuntu14.tar.gz
RUN cd downloads && tar -xvf riscv-qemu-4.1.0-2019.08.0-x86_64-linux-ubuntu14.tar.gz

RUN cd downloads && cp riscv64-unknown-elf-gcc-8.3.0-2019.08.0-x86_64-linux-ubuntu14/bin/* /usr/local/bin
RUN cd downloads && cp riscv-openocd-0.10.0-2019.08.2-x86_64-linux-ubuntu14/bin/* /usr/local/bin
RUN cd downloads && cp riscv-qemu-4.1.0-2019.08.0-x86_64-linux-ubuntu14/bin/* /usr/local/bin