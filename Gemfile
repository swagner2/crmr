source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6'

gem 'rails', '~> 6.0.0'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'sass-rails', '~> 6.0'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'annotate'
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Jumpstart dependencies
gem 'jumpstart', path: 'lib/jumpstart'

gem 'administrate', github: 'excid3/administrate', branch: 'jumpstart' #'~> 0.10.0'
gem 'administrate-field-active_storage', '~> 0.2.0'
gem 'attr_encrypted', '~> 3.1'
gem "devise", ">= 4.7.1"
gem 'devise_invitable', '~> 2.0', '>= 2.0.1'
gem 'devise_masquerade', '~> 0.6.5'
gem 'image_processing', '~> 1.9', '>= 1.9.2'
gem 'inline_svg', '~> 1.3', '>= 1.3.1'
gem 'local_time', '~> 2.1'
gem 'name_of_person', '~> 1.0'
gem 'oj', '~> 3.8', '>= 3.8.1'
gem 'pagy', '~> 3.0'
gem 'pay', '~> 1.0.0.beta5'
gem 'pg_search', '~> 2.3'
gem 'receipts', '~> 0.2.2'
gem 'turbolinks_render', '~> 0.9.12'

# We always want the latest versions of these gems, so no version numbers
gem 'omniauth'
gem 'strong_migrations'
gem 'whenever', require: false

# Jumpstart manages a few gems for us, so install them from the extra Gemfile
if File.exists?("config/jumpstart/Gemfile")
  eval_gemfile "config/jumpstart/Gemfile"
end
