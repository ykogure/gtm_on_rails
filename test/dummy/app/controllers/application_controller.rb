class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :better_errors_hack,  if: -> { Rails.env.development? }
  
  private
    def better_errors_hack
      request.env['puma.config'].options.user_options.delete(:app) rescue nil
    end
end
