class Admin::HomeController < Admin::ApplicationController
  def index
    @pastas = Pasta.where(origem_type: nil)
  end
end
