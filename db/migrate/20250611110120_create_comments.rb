class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :diet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
