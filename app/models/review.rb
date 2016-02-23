class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

  validates :rating,
    presence: true,
    numericality: { greater_than: 0, less_than_or_equal_to: 5 }

end