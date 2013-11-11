require 'has_accounts_engine'
require 'rails'
require 'simple_form'
require 'has_scope'
require 'i18n_rails_helpers'

module HasAccountsEngine
  class Railtie < Rails::Engine
    engine_name "has_accounts_engine"
  end
end
