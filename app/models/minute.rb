class Minute < ActiveRecord::Base
  acts_as_taggable
  has_attached_file :minute, :styles => { :thumbnail => '240x200>' }
  validates_presence_of :contributor_email, :name
  
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  def validate
    unless minute_file_name.nil?
    	
      unless ACCEPTABLE_FILETYPES.include? minute_file_name.downcase.match(/\.[\w]+$/)[0]
        errors.add('minute', 'is not an acceptable filetype')
      end
      
    # validates_presence_of doesn't mark file fields indicating an error, 
    # use the code below until validates_presence_of is fixed
    else
      errors.add('minute', ' can\'t be blank.')
    end
  end
  
end
