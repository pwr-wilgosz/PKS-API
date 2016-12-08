source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0' # Use Puma as the app server

gem 'cancancan' #access management
gem 'rspec_api_documentation' #auto-generate docs
gem "responders" #respond_with

#three below are for session management
gem 'devise'
gem 'omniauth'
gem 'devise_token_auth'
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'rspec-rails', '~> 3.5'
  gem "factory_girl_rails", "~> 4.0"
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
end

group :production do
  gem 'pg' #postgres db on production
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
