class User < ActiveRecord::Base

  has_many :songs

  validates :username,
    presence: true,
    uniqueness: true

  validates :password,
    presence: true,
    length: { minimum: 6 }

end