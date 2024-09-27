# Dockerfile

# Use the official Ruby image
FROM ruby:3.3.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    nodejs \
    postgresql-client \
    build-essential \
    libpq-dev

# Set the working directory
WORKDIR /app

# Set build argument for RAILS_MASTER_KEY
ARG RAILS_MASTER_KEY

# Set environment variable for Rails Master Key
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Install Ruby gems
RUN bundle install --without development test

# Copy the rest of the application code
COPY . /app

# # Precompile assets (if using the asset pipeline)
# RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose the default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
