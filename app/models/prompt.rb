class Prompt < ApplicationRecord
  has_many :posts, dependent: :destroy

  belongs_to :user
  acts_as_votable
end
