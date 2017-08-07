class Post < ApplicationRecord
  belongs_to :prompt
  has_many :comments, dependent: :destroy

end
