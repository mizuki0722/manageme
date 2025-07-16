class AddDietIdToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :diet_id, :integer
  end
end
