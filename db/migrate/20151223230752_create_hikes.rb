class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
