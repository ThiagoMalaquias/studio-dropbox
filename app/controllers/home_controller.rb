class HomeController < ApplicationController
  def index
    @pastas = @user.pastas.where(origem_type: nil)
  end
end
