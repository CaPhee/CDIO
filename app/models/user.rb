class User < ApplicationRecord
     validates :email, :presence => true, :uniqueness => true, :length => { :in => 8..255 }
      belongs_to :role
      has_many :posts
end
