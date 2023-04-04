FROM ruby:3-alpine

#RUN apk add --update --no-cache --virtual run-dependencies \
#		build-base

RUN mkdir -p app
WORKDIR app

ADD Gemfile Gemfile.lock /app/
RUN bundle check | bundle install
ADD . /app

EXPOSE 4567
CMD ruby app.rb -o 0.0.0.0
