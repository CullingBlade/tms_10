class Subject < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks,
   reject_if: proc {|attributes| attributes['name'].blank?},
   allow_destroy: true
  default_scope ->{order(created_at: :desc)}
  
  validates :name, presence: true
  validates :user, presence: true
  validates :description, presence: true, length: {maximum: 140}
end
