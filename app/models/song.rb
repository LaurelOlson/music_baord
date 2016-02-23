class Song < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :title,
    presence: true

  validates :artist,
    presence: true

  # regex matches HTTP/HTTPS URL
  validates :url,
    format: { with: /(https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)|\A\Z|)/ }

end