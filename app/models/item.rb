class Item < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    validates :name, presence: true
    validates :amount_in_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :price, presence: true, numericality: {greater_than: 0}
    validate :item_not_on_market
    
    private

    def item_not_on_market
        if Item.find_by(name: self.name) && !self.id
            errors.add(:you, "are already selling that item!")
            #Message is added at the key `:you` solely to create full message: 
            #"You are already selling that item!"
        end
    end
end
