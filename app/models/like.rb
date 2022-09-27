class Like < ApplicationRecord
	belongs_to :book
	belongs_to :comment
	has_one :user, through: :book
end
