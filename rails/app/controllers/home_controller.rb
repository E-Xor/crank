class HomeController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @value = "Welcome home!"

    @value2 = "Yo3!"
    # render :index # I guess it's assumed?
  end
end
