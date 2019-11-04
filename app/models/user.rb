class User < ApplicationRecord

  has_many :attendances
  has_many :events, through: :attendance

  validates :email, presence: true
  validates :email, uniqueness: true
  

  #envoyer les mails à la création de l'user

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
