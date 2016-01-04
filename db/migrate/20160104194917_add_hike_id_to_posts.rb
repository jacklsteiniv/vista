class AddHikeIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hike_id, :integer
  end
end
