class Post < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_many :comments
    self.per_page = 10
end

    WillPaginate.per_page = 10