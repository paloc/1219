class Categorization < ActiveRecord::Base
  belongs_to :minute
  belongs_to :category
end
