class Minute < ActiveRecord::Base
  acts_as_taggable
  has_attached_file :minute, :styles => { :thumbnail => '200x200>' }
  validates_presence_of :minute_file_name, :contributor_email, :name
  
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  def validate
    unless minute_file_name.nil?
      unless ACCEPTABLE_FILETYPES.include? minute_file_name.downcase.match(/\.[\w]+$/)[0]
        errors.add('minute', 'is not an acceptable filetype')
      end
    end
  end
  
end
