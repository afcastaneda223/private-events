class Event < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "creator_id"
    has_many :attendees, class_name: "User", through: :attendance, foreign_key: "attendee_id"
    has_many :attendances
    scope :future, ->{ where("date > #{Time.now.to_s[0..9]}") }
    # scope :past, ->{ where( "date < #{Time.now.to_datetime}" ) }
end
