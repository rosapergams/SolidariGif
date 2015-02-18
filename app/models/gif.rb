class Gif < ActiveRecord::Base
  has_many :comments, dependant: :destroy
  belongs_to :category
  belongs_to :user
end
