class Comment < ApplicationRecord
	belongs_to :book
	has_one :user, through: :book
	has_many :likes, dependent: :destroy
end
