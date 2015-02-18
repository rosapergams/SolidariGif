class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.string :url
      t.string :caption
      t.integer :category_id
      t.integer :user_id
    end
  end
end
