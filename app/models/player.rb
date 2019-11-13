class Player < ApplicationRecord
    belongs_to :position
    belongs_to :club
    belongs_to :competition
    belongs_to :country
    has_one :playerStat
    # has_many :goals

    # def club_players
    #     @club_players = Player.where("club_id = ? AND position_id = ?", params[:club_id], params[:position_id]
    # end

    def birthdate
        dob = DateTime.strptime(self.birthday.to_s,'%s')
        dob.strftime("Born on %a the %d/%B/%Y")     
    end

    def age
        now = Time.now.utc.to_date
        birth = DateTime.strptime(self.birthday.to_s,'%s')
        age = now.year - birth.year
    end
end
