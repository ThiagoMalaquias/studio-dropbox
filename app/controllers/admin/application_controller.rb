class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'admin'

  def authenticate_user!
    unless administrador.present?
      redirect_to admin_login_path
      return
    end
  end

  def administrador
    return if cookies[:admin_studio_dropbox].blank?
    return @adm if @adm.present?

    @adm = Administrador.find(JSON.parse(cookies[:admin_studio_dropbox])["id"])
    @adm
  end
end
