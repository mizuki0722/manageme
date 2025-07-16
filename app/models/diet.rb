class Diet < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :blogs
end
