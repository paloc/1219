class RootController < ApplicationController
  
  def faq
  	render :layout => 'application_one_column'
  end

  def about
  	render :layout => 'application_one_column'
  end
end