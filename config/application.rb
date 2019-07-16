require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JamboIO
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('node_modules')
    config.assets.paths << Rails.root.join('ckeditor5-build-inline')
    config.assets.paths << Rails.root.join("lib")
    config.autoload_paths += %W(#{config.root}/lib)

    config.i18n.default_locale = :'pt-BR'

    # config/application.rb
    Bundler.require(*Rails.groups)
    if ['development', 'test'].include? ENV['RAILS_ENV']
      Dotenv::Railtie.load
    end


    config.middleware.use Rack::Cors do
    	allow do
    		origins 'http://localhost:10549'
    		resource '*', :headers => :any, :methods => [:get, :post, :options]
    	end
    end
    	
    
  end
end
