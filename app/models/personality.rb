class Personality < ApplicationRecord
    has_many :plant
    has_many :prompt
end
