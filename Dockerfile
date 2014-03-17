# Chef-server
#
# VERSION       0.1.0

FROM ubuntu:12.04
MAINTAINER Mike Splain mike.splain@gmail.com

RUN apt-get update
RUN apt-get install git curl wget build-essential libxml2-dev libxslt1-dev runit -y

RUN cd /tmp; wget -q https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef-server_11.0.11-1.ubuntu.12.04_amd64.deb

RUN dpkg -i /tmp/chef-server_11.0.11-1.ubuntu.12.04_amd64.deb

RUN sudo chef-server-ctl reconfigure
