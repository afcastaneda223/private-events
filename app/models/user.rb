class User < ApplicationRecord
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attended_events, through: :attendance, foreign_key: 'event_id'
end
