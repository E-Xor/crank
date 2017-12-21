class HomeController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @value = "Welcome home!"
    # render :index # I guess it's assumed?
  end
end
