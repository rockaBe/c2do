source 'https://rubygems.org'

# ruby '2.0.0'

gem 'rails', '4.0.1'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

# when problems with turbolinks and other gems e.g. foundation occur
# try using jquery-turbolinks see <https://github.com/kossnocorp/jquery.turbolinks>
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'acts_as_list'
gem 'cancan'
gem 'compass-rails', '~> 2.0.alpha.0'

# alternatively try using sorcery <https://github.com/NoamB/sorcery> for simple authentication
# gem 'sorcery' 
gem 'devise'
gem 'devise_invitable'

gem 'figaro'
gem 'haml-rails'
gem 'mysql2'
gem 'puma'
gem 'rolify'
gem 'simple_form'
# needed to use master, because 4.3.2 doesnt support offcanvas
# gem 'zurb-foundation'
gem 'foundation-rails'
gem 'foundation-datetimepicker-rails'

# only available in Development
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'letter_opener'
end

# only available in Development & Test
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'pry'
end

# only available in Test
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'faker'
  gem 'launchy'
  gem 'shoulda'
end
