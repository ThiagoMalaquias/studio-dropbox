class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def authenticate_user!
    unless user.present?
      redirect_to login_path
      return
    end
  end

  def user
    return if cookies[:user_studio_dropbox].blank?
    return @adm if @adm.present?

    @user = Usuario.find(JSON.parse(cookies[:user_studio_dropbox])["id"])
    @user
  end
end
