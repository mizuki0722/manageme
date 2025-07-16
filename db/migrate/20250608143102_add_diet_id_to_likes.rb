class AddDietIdToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :diet_id, :integer
  end
end
