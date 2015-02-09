class User < ActiveRecord::Base
  has_many  :subjects
  has_many  :tasks
  attr_accessor :remember_token  
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 250},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, length: {minimum: 6}
  validate file_size: {maximum: 1.megabytes.to_i}

  has_secure_password
  scope :trainees, -> {where(role: 'trainee')}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def suppervisor?
    self.role == "suppervisor"
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?    
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end