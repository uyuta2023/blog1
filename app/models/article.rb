class Article < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments
    validates :title, presence: true, length: { maximum: 30 }
    validates :body, presence: true, length: { maximum: 1000 }
end
