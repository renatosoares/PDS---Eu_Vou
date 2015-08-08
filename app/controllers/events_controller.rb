class EventsController < ApplicationController
  before_action :authenticate_user!, only:  [:edit, :update, :destroy, :create]
  before_action :set_property, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:show]
  # GET /events
  # GET /events.json
  def index
    @event = Event.new
    @events = Event.ativos.order(eu_vou_rating: :desc)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comment = current_user.comments.build #issue #16 por Renato -> problemas na hora que visualiza detalhes do evento sem esta logado com o usuário que criou. 
  end

  # GET /events/new
  # def new
  #   @event = Event.new
  # end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    current_user.point_for_create_event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_property
      @event = current_user.events_created.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to events_url, notice: 'Você não tem permissão para isso.'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:titulo, :descricao, :endereco, :data, :imagem, :category_ids => [])
    end
end
