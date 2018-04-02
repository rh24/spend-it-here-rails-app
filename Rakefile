# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :app do
  desc "Scrape coins"
  task :scrape_coins => :environment do
    Scraper.new.scrape_coins
  end
end

# rake app:scrape_coins
