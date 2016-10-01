class User < ActiveRecord::Base

  # user's assocition has many articles
  has_many :articles

  # turn the email to lowercase (downcase) format before hitting the database
  before_save{ self.email = email.downcase}

  # ensure that username will be present, unique, and well sized
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:25}

  # the same goes for email as well, in addition validate the email format
  VALID_EMAIL_REGEX= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            length: { maximum:105}, format: {with: VALID_EMAIL_REGEX}
end