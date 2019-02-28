class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :articles, dependent: :destroy
  has_many :comments, through: :articles

  validates :name,
    presence: true,
    length: { in: 3..20 },
    format: { with: /\A(?!\d*\z)[a-z0-9]+\z/i } # 半角英数字のみ ただし数字のみは不可

  validates :introduce,
    length: { maximum: 200 }

  def articles_find
    Article.where('user_id', id)
  end
end
