class Event < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendees, class_name: 'User', through: :attendance, foreign_key: 'attendee_id'
  has_many :attendances
  scope :future, -> { where('date >= ?', Date.today).order(date: :ASC) }
  scope :past, -> { where('date < ?', Date.today).order(date: :ASC) }
end
