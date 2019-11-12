module  TopStats
    module ClassMethods
    end

    module InstanceMethods 
 
        def getAllPlayerStats
            self.players.map{|player|player.playerStat}
        end
    
        def sortByTopStat(my_stat, top_x)
            top_players = self.getAllPlayerStats.sort_by do |stat|
                -stat.method(my_stat).call
    
            end[0...top_x]
            
            #removeZeroStat(top_players, my_stat)
        end
    
        def removeZeroStat(top_players, my_stat)
            top_players.select do |stat| 
                stat.method(my_stat).call > 0
            end
        end
    
        def getTopStat(my_stat, top_x)
            self.sortByTopStat(my_stat, top_x).map do |stat|
                {
                    :id => stat.player.id,
                    :name => stat.player.name, 
                    :num_stat => stat.method(my_stat).call,
                    :image => stat.player.club.image         
                }
            end
        end
    end
end