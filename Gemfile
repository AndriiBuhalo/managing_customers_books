source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'
gem 'rails', '~> 7.0.8'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'devise', '~> 4.9'
gem 'devise-jwt', '~> 0.11'
gem 'jsonapi-serializer', '~> 2.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'rack-cors'

group :development, :test do
  gem 'rspec-rails'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end


group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
