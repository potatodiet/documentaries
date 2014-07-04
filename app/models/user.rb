require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor(:password)

  before_save(:encrypt_password)

  validates_presence_of(:username)
  validates_uniqueness_of(:username)
  validates_presence_of(:email_address)
  validates_uniqueness_of(:email_address)
  validates_presence_of(:password, on: :create)

  has_many(:documentaries, foreign_key: 'uploader_id')
  has_many(:reviews, foreign_key: 'reviewer_id')

  def self.authenticate(email_address, password)
    user = User.where(email_address: email_address).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(
      password, user.password_salt
    )

      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
