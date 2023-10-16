FROM rust:1.73-buster AS build
RUN useradd -m myuser
COPY . /build
RUN chown -R myuser /build
WORKDIR /build
RUN cargo build --release
EXPOSE 8080
WORKDIR /prod
CMD "./wik_dps_tp01_1"
