class AddQuestion5ToPerfumes < ActiveRecord::Migration[7.1]
  def change
    add_column :perfumes, :question5, :string
  end
end
