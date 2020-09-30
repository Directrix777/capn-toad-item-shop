class Item < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    validates :amount_in_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :price, presence: true, numericality: {greater_than: 0}
end
