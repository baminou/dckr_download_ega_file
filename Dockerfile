FROM ubuntu:16.04

#export ASCP_EGA_HOST
#export ASCP_EGA_USER
#export ASPERA_SCP_PASS

MAINTAINER Name <brice.aminou@gmail.com>

RUN apt-get update && apt-get install -y git && apt-get install -y wget

RUN apt-get install -y python-pip

RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y python-software-properties

RUN wget https://download.asperasoft.com/download/sw/ascp-client/3.5.4/ascp-install-3.5.4.102989-linux-64.sh -O /ascp.sh
RUN /bin/bash /ascp.sh

RUN mkdir /scripts
COPY tools/download_ega_file.py /scripts/download

RUN chmod +x /scripts/download

ENV PATH="/scripts/:${PATH}"

ENTRYPOINT ["download"]
