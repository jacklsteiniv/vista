class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :img_url
      t.string :text
      t.integer :upvotes, :default => 0
      t.integer :downvotes, :default => 0

      t.timestamps null: false
    end
  end
end
