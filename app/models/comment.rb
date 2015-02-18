class Comment < ActiveRecord::Base
  belongs_to :gif
  belongs_to :user
end
