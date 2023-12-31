class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_secure_password
    before_save { self.email = email.downcase }    
    validates :name, presence: true, length: { maximum: 255 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    #validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
