FROM ruby:2.7.0

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update -qq \
    && apt-get install -y nodejs \
    && npm install -g yarn

# gem
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# glibcのバージョン問題を回避
RUN bundle config set force_ruby_platform true
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]