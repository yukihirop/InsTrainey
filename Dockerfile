FROM ruby:2.1.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install -j4 --path=vendor/bundle
ADD . /app

ENV DATABASE_HOST db
ENV DATABASE_USERNAME postgres
ENV DATABASE_PASSWORD ""
