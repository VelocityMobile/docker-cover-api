FROM debian:9-slim

RUN apt-get update && \
  apt-get install -y build-essential libssl-dev \
  libpq-dev nodejs curl gnupg2 procps git liblzma-dev zlib1g-dev libyaml-dev patch \
  libxml2-dev libxslt-dev curl

RUN curl https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2 -o ruby-1.9.3-p551.tar.bz2 && \
  tar -xjf ruby-1.9.3-p551.tar.bz2 && \
  cd ruby-1.9.3-p551 && \
  ./configure && \
  make && \
  make install

RUN gem install bundler -v 1.17.3 && gem install nokogiri -v 1.5.10

CMD ["/bin/sh"]
