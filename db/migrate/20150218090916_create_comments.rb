class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :gif_id
      t.integer :user_id
    end
  end
end
