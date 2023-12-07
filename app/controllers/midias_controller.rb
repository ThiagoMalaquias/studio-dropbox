class MidiasController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_midia, only: %i[ show ]

  def show
  end

  private
    def set_midia
      @midia = Midia.find(params[:id])
    end
end
