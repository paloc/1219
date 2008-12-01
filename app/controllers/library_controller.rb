class LibraryController <  ApplicationController
	
  def staffpics
  	@minutes = []
    staff_pics = Category.find(:first, :conditions => "name = 'Staff pics'")
    unless staff_pics.nil?
      @minutes = staff_pics.minutes
    end

    render :layout => 'application_one_column'
  end
	
end