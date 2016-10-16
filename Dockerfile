############################################################
# Dockerfile to build the R Facebook app server image
# Based on R rocker's r-base
############################################################

FROM rocker/r-base

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y libcurl4-openssl-dev libssl-dev

COPY fb_oauth /home/fb_oauth
COPY installDependencies.R /home/installDependencies.R
COPY fbRepository.R /home/fbRepository.R
ADD pageResource.R /home/pageResource.R
ADD runServer.R /home/runServer.R

WORKDIR /home

RUN Rscript installDependencies.R

EXPOSE 8000
ENTRYPOINT Rscript runServer.R $1