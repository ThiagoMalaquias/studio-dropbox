class HomeController < ApplicationController
  def index
    @pastas = Pasta.where(origem_type: nil)
  end
end
