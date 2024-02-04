# Use the official Ruby image with your desired version
FROM ruby:3.1.0

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN gem install bundler
RUN bundle install

# Copy the rest of the application code into the image
COPY . .

# Expose port 4000 to the Docker host
EXPOSE 4000

# Set environment variables
ENV RAILS_ENV=development
ENV PORT=4000

# Precompile assets, migrate the database, and start the Rails server
CMD ["bash", "-c", " RAILS_ENV=development bundle exec rake db:create db:migrate && RAILS_ENV=development bundle exec rails s -b '0.0.0.0' -p $PORT"]
