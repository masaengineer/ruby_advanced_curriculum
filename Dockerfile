FROM ruby:3.1.3
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update
WORKDIR /app
