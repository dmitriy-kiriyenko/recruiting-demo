class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_)
    dashboard_url
  end
end
