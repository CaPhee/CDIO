class Post < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :comments
    has_many :images
    has_many :likes
end

