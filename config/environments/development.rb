Rails.application.configure do
  

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  host = 'jason-bamidele-delejason1211.c9users.io'
  config.action_mailer.default_url_options = { :host => host, protocol: 'https' }
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  # config.action_view.raise_on_missing_translations = true

  #Trying with Hartl tutorial
  config.action_mailer.delivery_method = :test



end
