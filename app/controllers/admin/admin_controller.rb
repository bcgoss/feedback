class Admin::AdminController < ActionController::Base
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    current_user.admin?
  end
end
