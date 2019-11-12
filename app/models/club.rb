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

    def sortByTopScorers
        self.getAllPlayerStats.sort_by{|stat|-stat.goals_overall}[0...5].select{|stat|stat.goals_overall > 0} 
    end

    def getTopScorers
        self.sortByTopScorers.map do |stat|
            {
                :name => stat.player.name, 
                :num_points => stat.goals_overall
            }
        end
    end

    def sortByTopAssisters
        self.getAllPlayerStats.sort_by{|stat|-stat.assists_overall}[0...5].select{|stat|stat.assists_overall > 0} 
    end

    def getTopAssisters
        self.sortByTopAssisters.map do |stat|
            {
                :name => stat.player.name, 
                :num_points => stat.assists_overall
            }
        end
    end

    def sortByTopYellowCards
        self.getAllPlayerStats.sort_by{|stat|-stat.yellow_cards_overall}[0...5].select{|stat|stat.yellow_cards_overall > 0} 
    end

    def getTopYellowCards
        self.sortByTopYellowCards.map do |stat|
            {
                :name => stat.player.name, 
                :num_points => stat.yellow_cards_overall
            }
        end
    end

    def sortByTopRedCards
        self.getAllPlayerStats.sort_by{|stat|-stat.red_cards_overall}[0...5].select{|stat|stat.red_cards_overall > 0} 
    end

    def getTopRedCards
        self.sortByTopRedCards.map do |stat|
            {
                :name => stat.player.name, 
                :num_points => stat.red_cards_overall
            }
        end
    end

  
end
