class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :comments, through: :books
  has_many :likes, through: :books
  has_one_attached :image, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {others: 0, author: 1}

  validates :name, :email, :password, presence: true
end
