class User < ApplicationRecord
    has_many :orders
    has_many :items, through: :orders
    has_secure_password
    validates :username, uniqueness: true, presence: true
    validates :password_digest, presence: true

    def self.randomly_generate
        (0...25).map { (65 + rand(26)).chr }.join
    end
end
