class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image_url, :default => 'http://oregon2.sierraclub.org/sites/or.sierraclub.org/files/columbia-group/images/hiker_logo.gif'

      t.timestamps null: false
    end
  end
end
