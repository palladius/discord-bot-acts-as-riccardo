#FROM ruby:2.7
FROM ruby:3.0

WORKDIR /app

COPY Gemfile* .
RUN bundle install

COPY .envrc VERSION *.rb *.sh  .
COPY .envrc.private2 .envrc.private
COPY .envrc.private.sanitized .
COPY lib/ lib/

#CMD ["bundle", "exec", "ruby", "bot.rb"]
CMD ["ruby", "bot.rb"]


