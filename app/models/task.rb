class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  default_scope ->{order(created_at: :desc)}
  
  validates :name, presence: true
end
