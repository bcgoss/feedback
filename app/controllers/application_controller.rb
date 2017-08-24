class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authorize_user!
  protect_from_forgery with: :exception

  private

  def authorize_user!
    current_user && !(current_user.unverified?)
  end
end
