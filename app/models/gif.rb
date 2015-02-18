class Gif < ActiveRecord::Base
  has_many :comments
  belongs_to :category
  belongs_to :user
end
