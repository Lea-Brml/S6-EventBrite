class User < ApplicationRecord

  has_many :attendances
  has_many :events, through: :attendance

  validates :email, presence: true
  validates :email, uniqueness: true 

end
