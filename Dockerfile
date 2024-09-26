# Use the official Ruby image
FROM ruby:3.3.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Install Ruby gems
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Set environment variables for production
ENV RAILS_ENV=production
ENV RACK_ENV=production

# Expose the default Rails port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
