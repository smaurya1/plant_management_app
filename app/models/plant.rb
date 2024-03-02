class Plant < ApplicationRecord
    belongs_to  :user
    belongs_to  :personality
    has_one_attached :image
    has_one :plant_info
    has_one :health_check
end
