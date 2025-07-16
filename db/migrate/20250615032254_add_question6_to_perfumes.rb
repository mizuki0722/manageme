class AddQuestion6ToPerfumes < ActiveRecord::Migration[7.1]
  def change
    add_column :perfumes, :question6, :string
  end
end
