class Club < ApplicationRecord
    has_many :players
    belongs_to :country
    belongs_to :stadium
    belongs_to :competition
    has_one :clubStat
    # has_many :goals
    # has_many :clubColors
    # has_many :colors, through: :clubColors
    has_many :favourites
    has_many :users, through: :favourites


    def getAllPlayerStats
        self.players.map{|player|player.playerStat}
    end

    def sortByTopStat(my_stat)
        top_players = self.getAllPlayerStats.sort_by do |stat|
            -stat.method("#{my_stat}_overall").call

        end
        
        removeZeroStat(top_players, my_stat)
    end

    def removeZeroStat(top_players, my_stat)
        top_players[0...5].select do |stat| 
            stat.method("#{my_stat}_overall").call > 0
        end
    end

    def getTopStat(my_stat)
        self.sortByTopStat(my_stat).map do |stat|
            {
                :name => stat.player.name, 
                :num_stat => stat.method("#{my_stat}_overall").call           
            }
        end
    end

  
end
