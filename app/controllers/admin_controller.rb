class AdminController < ApplicationController
  
  before_filter :authenticate
  
  def index
    @minutes = Minute.all
  end
  
end
