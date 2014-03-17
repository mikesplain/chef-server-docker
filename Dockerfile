# Chef-server
#
# VERSION       0.1.0

FROM ubuntu:12.04
MAINTAINER Mike Splain mike.splain@gmail.com

RUN apt-get update
RUN apt-get install git curl wget build-essential libxml2-dev libxslt1-dev -y

RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN mkdir -p /var/chef/cache /root/chef-server
RUN wget -qO- https://github.com/opscode-cookbooks/chef-server/archive/master.tar.gz | tar xvzC /root/chef-server --strip-components=1

RUN cd root/chef-server; /opt/chef/embedded/bin/gem install bundler; /opt/chef/embedded/bin/bundle
RUN cd root/chef-server; /opt/chef/embedded/bin/gem install berkshelf; /opt/chef/embedded/bin/berks vendor /var/chef/cookbooks

RUN chef-solo -o 'recipe[chef-server::default]'