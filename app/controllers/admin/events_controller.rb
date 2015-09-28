class Admin::EventsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin
  layout "admin"

  def index
    @events = Event.all
  end

  protected

  def check_admin
    unless current_user.admin?
      raise ActiveRecord::RecordNotFound #導向404
      redirect_to root_path
    end
  end

end
