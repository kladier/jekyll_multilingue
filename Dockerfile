FROM ubuntu:14.04

MAINTAINER yourname

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install make g++ python git ruby ruby-dev gem

#Do not forget to install your markdown converter gem
#( e.g. kramdown or rdisount)
RUN gem install bundler therubyracer kramdown

ADD Gemfile /websiterepository/Gemfile
ADD Gemfile.lock /websiterepository/Gemfile.lock
WORKDIR /websiterepository
RUN bundle install

#Download your jekyll website repository from github
ADD . /websiterepository

#Expose the default port from jekyll
EXPOSE 4000

#Set the default command to execute at launch
CMD ["jekyll", "serve"]
