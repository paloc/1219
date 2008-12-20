class MinutesController < ApplicationController
  
  before_filter :authenticate, :only => [:show, :index]
  
  def index
    @minutes = Minute.find(:all)
  end
  
  def new
    @minute = Minute.new
  end
  
  def create
    @minute = Minute.new(params[:minute])
    if @minute.save
      Mailer.deliver_thankyou_mail(@minute)
      redirect_to '/thanks'
    else
      flash[:notice] = "We were not able to process your submission!"
      render :action => 'new'
    end
  end
  
  def show
    @minute = Minute.find(params[:id])
  end
  
  def update
    @minute = Minute.find(params[:id])
    unless params[:minute].nil?
      unless Category.find(params[:minute][:categories]).nil?
        categories = Category.find(params[:minute][:categories])
  	  end
	else
      categories = []
	end
	@minute.categories = categories
    redirect_to minute_path(@minute)
  end
  
end
