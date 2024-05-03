FROM ruby:3.2.2-bullseye as base

WORKDIR /app

FROM base

COPY Gemfile* /app
