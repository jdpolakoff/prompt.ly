class Prompt < ApplicationRecord
  has_many :posts, dependent: :destroy

end
