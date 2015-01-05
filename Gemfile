source "https://rubygems.org"

gem "rails", "4.1.1"

platform :mri do
    gem "pg"
    gem "thin", "~> 1.6.2"
end

platform :jruby do
    gem "activerecord-jdbcpostgresql-adapter"
    gem "puma"
end

# Assets
gem "sass-rails", "~> 4.0.3"
gem "uglifier", "~> 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "turbolinks"
gem "haml-rails"

gem "foundation-rails", "5.4.5"
gem "foundation_rails_helper"
gem "will_paginate"
gem "will_paginate-foundation"

gem "acts-as-taggable-on"

gem "cancancan", "~> 1.8"

gem "devise"

group :production do
  gem "rails_12factor"
  gem "newrelic_rpm"
end
