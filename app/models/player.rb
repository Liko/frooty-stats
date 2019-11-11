class Player < ApplicationRecord
    belongs_to :position
    belongs_to :club
    belongs_to :country
    has_many :goals

    # def club_players
    #     @club_players = Player.where("club_id = ? AND position_id = ?", params[:club_id], params[:position_id]
    # end
end
