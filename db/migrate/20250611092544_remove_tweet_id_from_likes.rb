class RemoveTweetIdFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_reference :likes, :tweet, null: false, foreign_key: true
  end
end
