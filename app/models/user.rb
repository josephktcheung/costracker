require 'bcrypt'

PASSWORD_RESET_EXPIRES = 4

class User

  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  field :email, type: String
  field :salt, type: String
  field :fish, type: String
  field :code, type: String
  field :expires_at, type: Time

  before_save :set_random_password, :encrypt_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true

  has_many :items

  def self.authenticate(email, password)
    user = User.find_by email: email
    user if user and user.authenticate(password)
  end

  def self.find_by_code(code)
    user = User.find_by(code: code, expires_at: {"$gte" => Time.now.gmtime})
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    self.set_expiration
  end

  def set_expiration
    self.expires_at = PASSWORD_RESET_EXPIRES.hours.from_now
    self.save!
  end

  protected
    def set_random_password
      if self.fish.blank? and password.blank?
        self.salt = BCrypt::Engine.generate_salt
        self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), self.salt)
      end
    end

    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.fish = BCrypt::Engine.hash_secret(password, self.salt)
      end
    end
end