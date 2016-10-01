class Article < ActiveRecord::Base

  # article's assocition must be written by a user
  belongs_to :user

  # empty & length validation
  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :description, presence: true, length:{minimum:10, maximum:300}
  validates :user_id, presence: true
end