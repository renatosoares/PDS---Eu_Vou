class EuvouController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def confirmation
    if @event.users.exclude?(current_user)
      @event.users << current_user
      @event.eu_vou_rating = @event.eu_vou_rating + 1
      current_user.point_of_presence
      respond_to do |format|
        if @event.save
          format.html { redirect_to root_path, notice: 'EuVou! Confirmado.' }
          format.js { flash[:notice] =  'EuVou! Confirmado.'}
        else
          format.html { redirect_to root_path, notice: 'Problemas na confirmação EuVou!' }
          format.js { flash[:notice] =  'Problemas na confirmação EuVou!'}
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'EuVou! já foi clicado.' }
        format.js { flash[:notice] =  'EuVou! já foi clicado.'}
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

end
