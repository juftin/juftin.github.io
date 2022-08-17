FROM jekyll/jekyll:4

COPY Gemfile Gemfile.lock /project/

RUN cd /project/ && bundle install
