class Admin::LoginController < Admin::ApplicationController
  skip_before_action :authenticate_user!
  layout 'login'

  def index; end

  def logar
    user = Administrador.find_by(email: params[:login][:email], senha: params[:login][:senha])
    if user.nil?
      flash[:erro] = "Email ou senha inválidos"
      redirect_to admin_login_path
      return
    end

    time =  1.year.from_now
    value = { id: user.id, nome: user.nome, email: user.email }
    cookies[:admin_studio_dropbox] = { value: value.to_json, expires: time, httponly: true }

    redirect_to admin_root_path
  end

  def deslogar
    cookies[:admin_studio_dropbox] = nil
    redirect_to admin_login_path
  end
end
