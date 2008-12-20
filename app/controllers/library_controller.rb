class LibraryController <  ApplicationController
	
  def staffpics
  	@minutes = []
    staff_pics = Category.find(:first, :conditions => "name = 'Staff pics'")
    unless staff_pics.nil?
      @minutes = staff_pics.minutes
    end
    
    if params[:id].to_i == @minutes.length
      indx = 0
	else
	  indx = params[:id].to_i
	end
    
    @minute = @minutes[indx]
	@nextPicIndex = indx + 1
	
    render :layout => 'application_one_column'
  end
	
end