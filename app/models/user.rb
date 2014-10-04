class User < ActiveRecord::Base
  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  )

  attr_accessor(:login)

  ROLES = %w[regular admin]

  validates_presence_of(:name)
  validates_uniqueness_of(:name)
  validates_presence_of(:email)
  validates_uniqueness_of(:email)

  before_save(:default_values)

  has_many(:documentaries, foreign_key: "uploader_id")
  has_many(:reviews, foreign_key: "reviewer_id")

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value OR email = :value", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  def default_values
    self.role ||= "regular"
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
