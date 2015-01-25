class Bookmark < ActiveRecord::Base
  belongs_to :user
  
  markable_as :liked
end
