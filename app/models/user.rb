class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  has_many :gifs, dependant: :destroy
  as_many :comments, dependant: :destroy
end
