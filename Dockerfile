#FROM ruby:2.7
FROM ruby:3.0

RUN apt update && apt install direnv

WORKDIR /app

COPY Gemfile* .
RUN bundle install

COPY VERSION *.rb *.sh  .
# Copy all except the one which is symlinked in Ricc Repo
COPY .envrc .envrc.private.dist .envrc.private.sanitized .
# Copy the symlinked in Ricc Repo as if it was Antani
COPY .envrc.private.copynosymlink  .envrc.private
COPY lib/ lib/
RUN mkdir bin/
COPY bin/* ./bin/

#CMD ["bundle", "exec", "ruby", "bot.rb"]
#CMD ["ruby", "bot.rb"]
CMD ["bash", "entrypoint8080.sh"]



