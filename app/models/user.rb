class User < ApplicationRecord
  # Deviseのモジュール設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ActiveStorageの設定（これが重要！）
  has_one_attached :avatar

  # 関連
  has_many :diets, dependent: :destroy
  has_many :blogs, through: :diets
  has_many :likes, dependent: :destroy
  has_many :liked_diets, through: :likes, source: :diet
  has_many :comments, dependent: :destroy

  # メソッド
  def already_liked?(diet)
    self.likes.exists?(diet_id: diet.id)
  end

  # バリデーション
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
end