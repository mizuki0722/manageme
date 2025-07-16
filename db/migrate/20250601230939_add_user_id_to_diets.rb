class AddUserIdToDiets < ActiveRecord::Migration[7.1]
  def change
    add_column :diets, :user_id, :integer
  end
end
