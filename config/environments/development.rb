Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true


  ################# 追加分 (ActionMailer) ##############################

  # キャッシュの機能を有効に(defaultではfalseになっている)
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  #smptサーバー経由でgmailの送信を許可する(ActionMailer)
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :port => '587',
      :enable_starttls_auto => true,
      :address => 'smtp.gmail.com',
      :domain => 'localhost:3000',
      :authentication => 'plain',
      :user_name => 'te108186@gmail.com',
      :password => 'b201401te108186'
  }

  # 利用するホスト名の定義
  config.action_mailer.default_url_options = {
      :host => 'http://0.0.0.0:3000'
  }


  #####################################################


  ########### 追加分 (キャッシュ機能) ###################

  config.action_controller.perform_caching = true

  ####################################################


  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.assets.compile = true
end
