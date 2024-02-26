class Plant < ApplicationRecord
    belongs_to  :user
    belongs_to  :personality
    has_one_attached :image
end
