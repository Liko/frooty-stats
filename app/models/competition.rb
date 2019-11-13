class Competition < ApplicationRecord
    include TopStats::InstanceMethods

    has_many :clubs
    has_many :players
    has_many :matches

end
