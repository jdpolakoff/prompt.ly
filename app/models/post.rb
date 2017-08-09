class Post < ApplicationRecord
  belongs_to :prompt
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable
end
