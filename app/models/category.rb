class Category < ActiveRecord::Base
  has_many :gifs, dependant: :destroy
end
