# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# dotenv gem need to be listed earlier than the gems that require dotenv
gem 'dotenv-rails', groups: [:development, :test], require: 'dotenv/rails-now'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'devise'
gem 'omniauth-google-oauth2'
gem "simple_calendar"
gem "font-awesome-rails"
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'rack-mini-profiler'
  gem 'memory_profiler'
  gem 'flamegraph'
  gem 'stackprof'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
