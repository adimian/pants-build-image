FROM python:3.13-bookworm

RUN apt-get update
RUN apt-get install ca-certificates curl gnupg

RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN chmod +x ./get-docker.sh
RUN ./get-docker.sh

RUN curl --proto '=https' --tlsv1.2 -fOsSL https://static.pantsbuild.org/setup/get-pants.sh && \
    bash ./get-pants.sh --bin-dir /usr/local/bin
RUN SCIE_BOOT=update pants
RUN pip install awscli
