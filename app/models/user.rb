class User < ApplicationRecord

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendance

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy

  #envoyer les mails à la création de l'user

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end
