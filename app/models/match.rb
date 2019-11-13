class Match < ApplicationRecord
    # has_many :goals
    belongs_to :home_club, class_name: 'Club', required: true, foreign_key: :home_id
    belongs_to :away_club, class_name: 'Club', required: true, foreign_key: :away_id
    belongs_to :stadium 
    belongs_to :competition

    def home_club_name
        self.home_club.name
    end

    def away_club_name
        self.away_club.name
    end

    def real_date
        date = DateTime.strptime(self.date.to_s,'%s')
        date.strftime("%A %d %B %Y")   
    end

    def real_time
        date = DateTime.strptime(self.date.to_s,'%s')
        date.strftime("%R")
    end
end
