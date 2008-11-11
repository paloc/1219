class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :categorizations
  has_many :minutes, :through => :categorizations
end
