class Deck < ApplicationRecord
    has_many :cards

    validates_uniqueness_of :deck_name
    
end
