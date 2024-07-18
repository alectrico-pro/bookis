FROM ruby:3.1.5-slim
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libvips \
    libpq-dev \
    libyaml-dev \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add Node.js to sources list
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

# Install Node.js version that will enable installation of yarn
RUN apt-get install -y --no-install-recommends \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g yarn

WORKDIR /usr/local/app
COPY . /usr/local/app
#RUN bundler update

RUN bundle install -j $(nproc) 


COPY .dockerdev/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 2300
CMD ["bundle", "exec", "puma","-C", "config/puma.rb"]
