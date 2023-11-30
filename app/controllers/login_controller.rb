class LoginController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'login'

  def index; end

  def logar
    user = Usuario.find_by(email: params[:login][:email], senha: params[:login][:senha])
    if user.nil?
      flash[:erro] = "Email ou senha inválidos"
      redirect_to login_path
      return
    end

    time =  1.year.from_now
    value = { id: user.id, nome: user.nome, email: user.email }
    cookies[:user_studio_dropbox] = { value: value.to_json, expires: time, httponly: true }

    redirect_to root_path
  end

  def deslogar
    cookies[:user_studio_dropbox] = nil
    redirect_to root_path
  end
end
