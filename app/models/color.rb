class Color < ApplicationRecord
    has_many :clubColors
    has_many :clubs, through: :clubColors
end
