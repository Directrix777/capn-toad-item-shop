class Order < ApplicationRecord
    belongs_to :item
    belongs_to :user
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :amount_id, presence: true, numericality: {greater_than: 0}
end
