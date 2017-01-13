require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhilousPlanningPoker
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators.test_framework :rspec
  end

  TITLE = "Philou's Planning Poker"
  KEYWORDS = "Planning Poker, Software Estimates, Work Estimates, Remote Team, Remote Planning Poker"
end
