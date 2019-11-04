class Event < ApplicationRecord

  has_namy :attendances
  has_namy :users, through: :attendance

  belongs_to :user      #affaire à suivre 

  validates :start_date, presence: true

  validates :duration, presence: true

  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 140}

  validates :description, presence: true
  validates :description, length: {minimum: 20, maximum:1000}

  validates :price, numericality: {greater_tan: 0, less_than: 1001}
  validates :location, presence: true

  validate :multiple

  validate :start_date_time

  def multiple_5

    errors.add(:duration, "La durée doit être un multiple de 5.") unless
    return self.duration %5 == 0

  end

  def start_date_time

      errors.add(:start_date, "Tu ne peux pas créer un évènement dans le passé") unless
      start_date > Time.now
  end

  end



end
