class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user
      t.integer :rating
      t.text :description

      t.timestamps null: false
    end
  end
end
