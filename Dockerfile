FROM debian:9-slim

RUN apt-get update && apt-get install -y build-essential \
  libpq-dev nodejs curl gnupg2 procps git liblzma-dev zlib1g-dev patch \
  libxml2-dev libxslt-dev

RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

RUN curl -sSL https://get.rvm.io | bash -s stable --ruby

RUN bash -l -c 'rvm install ruby-1.9.3-p551 && rvm --default use ruby-1.9.3-p551 && gem install bundler -v 1.17.3 && gem install nokogiri -v 1.5.10'

CMD ["/bin/bash", "-l", "-c"]
