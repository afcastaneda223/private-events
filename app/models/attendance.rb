class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'attendee_id'
  belongs_to :event, class_name: 'Event', foreign_key: 'event_id'
end
