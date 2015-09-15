class EventsController < ApplicationController

  #GET/events/index
  #GET/events
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  def index
  @events = Event.page(params[:page]).per(10)
  end

  #GET /events/show/:id
  def show
    @page_title = @event.name
  end

  #GET/events/new
  def new
    @event = Event.new
  end

  #POST events/reate

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "新增成功"
      redirect_to :action => :index #告訴瀏覽器Http code:303
    else
    render :action => :new #new.html.erb
    end
  end

  #GET/events/edit/:id
  def edit
  end

  #POST /events/update/:id
  def update
    @event.update(event_params)
    if @event.update(event_params)
    flash[:notice] = "編輯成功"
    redirect_to :action => :show, :id => @event
    else
    render :action => :edit
  end
  end

  #GET /events/destroy/:id
  def destroy
    @event.destroy
    flash[:alert] = "刪除成功"
    redirect_to :action => :index
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end

  def set_event
  @event = Event.find(params[:id])
  end
end
