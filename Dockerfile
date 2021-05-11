FROM ruby:2.7.2
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn
RUN gem update bundler
WORKDIR /kwartracker-api
COPY Gemfile /kwartracker-api/Gemfile
COPY Gemfile.lock /kwartracker-api/Gemfile.lock
RUN bundle install

COPY package.json /kwartracker-api/package.json
COPY yarn.lock /kwartracker-api/yarn.lock
RUN yarn install
COPY . /kwartracker-api
RUN bundle exec rake assets:precompile


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
