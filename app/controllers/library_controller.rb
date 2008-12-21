class LibraryController <  ApplicationController
	
  def staffpics
  	@minutes = []
    staff_pics = Category.find(:first, :conditions => "name = 'Staff pics'")
    unless staff_pics.nil?
      @minutes = staff_pics.minutes
    end
    
    @picsRange 		= 1..@minutes.length
    @currPicIndx	= @picsRange.include?(params[:id].to_i) ? params[:id].to_i : 1
    @minute 		= @minutes[@currPicIndx-1]
    @nextPicIndx 	= (@currPicIndx == @picsRange.last ? @picsRange.first : @currPicIndx+1 )
    @prevPicIndx 	= (@currPicIndx == @picsRange.first ? @picsRange.last : @currPicIndx-1 )
	
    render :layout => 'application_one_column'
  end
	
end