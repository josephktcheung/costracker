require 'bcrypt'

class User

  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  field :email, type: String
  field :salt, type: String
  field :fish, type: String

  before_save :set_random_password, :encrypt_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }

  embeds_many :items

  def self.authenticate(email, password)
    user = User.find_by email: email
    user if user and user.authenticate(password)
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end


  protected
    def check_password_and_password_confirmation
      errors.add(:password_confirmation, "does not match password") unless self.password == self.password_confirmation
    end

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