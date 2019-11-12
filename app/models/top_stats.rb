module  TopStats
    module ClassMethods
    end

    module InstanceMethods 
 
        def getAllPlayerStats
            self.players.map{|player|player.playerStat}
        end
    
        def sortByTopStat(my_stat, top_x)
            top_players = self.getAllPlayerStats.sort_by do |stat|
                -stat.send(my_stat)
    
            end[0...top_x]
            
            #removeZeroStat(top_players, my_stat)
        end
    
        def removeZeroStat(top_players, my_stat)
            top_players.select do |stat| 
                stat.send(my_stat) > 0
            end
        end
    
        def getTopStat(my_stat, top_x)
            self.sortByTopStat(my_stat, top_x).map do |stat|
                {
                    :id => stat.player.id,
                    :name => stat.player.name, 
                    :num_stat => stat.send(my_stat),
                    :image => stat.player.club.image         
                }
            end
        end
    end
end