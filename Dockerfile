FROM rust:1.73-buster AS build
RUN useradd -m myuser
COPY . /build
RUN chown -R myuser /build
USER myuser
WORKDIR /build
RUN cargo build --release




FROM debian:buster
RUN useradd -m myuser
COPY --from=build /build/target/release/wik_dps_tp01 /prod/wik_dps_tp01
USER myuser
EXPOSE 8080
WORKDIR /prod
CMD "./wik_dps_tp01"
