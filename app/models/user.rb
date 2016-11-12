class User < ApplicationRecord
  validates :email, :presence => true, :uniqueness => true, :length => { :in => 8..255 }
  has_many :posts
  attr_accessor :protected_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  VALID_PHONE_REGEX = /[+]?[\d]+[^a..z][^A..Z][^\B]\z/
  validates :phone, presence: true,
    format: {with: VALID_PHONE_REGEX},
    length: {minimum: 6, maximum: 12},
    allow_nil: true

  has_secure_password
  validates :password, presence: true,
    length: {minimum: 6}, allow_nil: true

  before_save :format_value

  mount_uploader :avatar, PictureUploader

  scope :search, ->keyword {where "name LIKE ?", "%#{keyword}%"}

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = BCrypt::Engine::MIN_COST
      BCrypt::Password.create string, cost: cost
    end
  end

  def authenticated? token
    return false if protected_digest.nil?
    BCrypt::Password.new(self.protected_digest).is_password? token
  end

  def remember
    self.protected_token = User.new_token
    update_attribute :protected_digest, User.digest(protected_token)
  end

  def forget
    self.update_attribute :protected_digest, nil
  end

  def is_user? other
    self == other
  end

  private
    def format_value
      self.email = email.downcase
    end
end
