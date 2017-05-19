require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# We want to include the spec dir when looking for special annotation comments
# TODO define env var in some special purpose place (check dotenv gem)
# TODO find a way to track annotation comments in files at the root of the repo
ENV['SOURCE_ANNOTATION_DIRECTORIES'] = ['spec',ENV['SOURCE_ANNOTATION_DIRECTORIES']].join(',')


module PhilousPlanningPoker
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators.test_framework :rspec

    # Track comments annotations on other file formats
    config.annotations.register_extensions("scss", "sass", "less", "coffee") { |tag| /\/\/\s*(#{tag}):?\s*(.*)$/ }
  end

  TITLE = "Philou's Planning Poker"
  KEYWORDS = "Planning Poker, Software Estimates, Work Estimates, Remote Team, Remote Planning Poker"
  FIBOS = [0, 1, 2, 3, 5, 8, 13, 20, 40]
end
