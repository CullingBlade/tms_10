class User < ActiveRecord::Base
  has_many  :subjects
  has_many  :tasks
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 250},
    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: {minimum: 6}
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def suppervisor?
    self.role == "suppervisor"
  end
end