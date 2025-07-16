class Like < ApplicationRecord
  belongs_to :diet
  belongs_to :user
  validates_uniqueness_of :diet_id, scope: :user_id
end
