class Category < ActiveRecord::Base
  has_many :gifs, dependant: :destroty
end
