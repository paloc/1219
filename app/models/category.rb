class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :minutes, :through => :categorizations
end
