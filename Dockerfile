FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client
WORKDIR /kwartracker-api
COPY Gemfile /kwartracker-api/Gemfile
COPY Gemfile.lock /kwartracker-api/Gemfile.lock
RUN bundle install
COPY . /kwartracker-api


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
