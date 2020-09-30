class Item < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    validates :name, presence: true
    validates :amount_in_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :price, presence: true, numericality: {greater_than: 0}
    validate :item_not_on_market
    
    private

    def item_not_on_market
        if self == Item.find_by(name: self.name)
            errors.add(:item_not_on_market, "You're already selling that item!")
        end
    end
end
