#
# Ruby 2.1.2 Dockerfile
#

# Pull base image.
FROM humongousdb/base

# Install Ruby.
RUN           apt-get -y update && \
              apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && \
              cd /tmp && \
              wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz && \ 
              tar -xvzf ruby-2.1.2.tar.gz && \
              cd ruby-2.1.2 && \
              ./configure --prefix=/usr/local && \
              make && \
              make install && \
              rm -rf ruby-2.1.2 

# Install Bundler.
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
