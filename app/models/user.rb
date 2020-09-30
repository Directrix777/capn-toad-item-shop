class User < ApplicationRecord
    has_many :orders
    has_many :items, through: :orders
    has_secure_password
    validates :username, uniquness: true, presence: true
    validates :password_digest, presence: true
end
