FROM ruby:2.7

WORKDIR /app

COPY Gemfile* .
RUN bundle install

COPY .envrc VERSION *.rb magic.sh  .
COPY .envrc.private2 .envrc.private
COPY lib/ lib/

CMD ["bundle", "exec", "ruby", "bot.rb"]

