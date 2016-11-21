class Post < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :comments
    has_many :images
    self.per_page = 10
    WillPaginate.per_page = 10
end

