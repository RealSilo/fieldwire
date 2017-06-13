source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'shrine', '~> 2.6', '>= 2.6.1'
gem 'aws-sdk', '~> 2.9', '>= 2.9.38'
gem 'roda', '~> 2.26'
gem 'jquery-fileupload-rails', '~> 0.4.7'

gem 'devise', '~> 4.3'
gem 'pundit', '~> 1.1'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'turbolinks', '~> 5'
gem 'active_model_serializers', '~> 0.10.6'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  
  gem 'rspec-rails', '~> 3.6'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'binding_of_caller'
end

group :development do
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

group :test do
  gem 'capybara', '~> 2.14', '>= 2.14.2'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
  gem 'poltergeist', '~> 1.15'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
