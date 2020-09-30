class Order < ApplicationRecord
    belongs_to :item
    belongs_to :user
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :amount, presence: true, numericality: {greater_than: 0}
    validate :cannot_be_more_than_in_stock

    def send_order
        item.update(amount_in_stock: item.amount_in_stock - amount)
    end

    def total
        item.price * amount
    end

    def item_name
        item.name
    end

    private

    def cannot_be_more_than_in_stock
        if amount > item.amount_in_stock
            errors.add(:amount, "is higher than what we have in stock.")
        end
    end
end
