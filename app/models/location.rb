class Location < ApplicationRecord
    belongs_to :area
    has_many :posts
    has_and_belongs_to_many :services
end
