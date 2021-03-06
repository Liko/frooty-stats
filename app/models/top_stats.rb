module  TopStats
    module ClassMethods
    end

    module InstanceMethods 
 
        def getAllStats(items)

            self.send(items).map{|item|item.send("#{items.to_s.singularize}Stat")}
        end
    
        def sortByTopStat(my_stat, top_x, items)
            top_players = self.getAllStats(items).sort_by do |stat|
                -stat.send(my_stat)
            end[0...top_x]
            
            #removeZeroStat(top_players, my_stat)
        end
    
        def removeZeroStat(top_players, my_stat)
            top_players.select do |stat| 
                stat.send(my_stat) > 0
            end
        end
    
        def getTopStat(my_stat, top_x, items)
            self.sortByTopStat(my_stat, top_x, items).map do |stat|
                if items == :players
                    {
                        :id => stat.player.id,
                        :name => stat.player.name, 
                        :num_stat => stat.send(my_stat),
                        :image => stat.player.club.image,
                        :instance => stat.player        
                    }
                elsif items == :clubs
                    {
                        :id => stat.club.id,
                        :name => stat.club.name,
                        :num_stat => stat.send(my_stat),
                        :image => stat.club.image, 
                        :instance => stat.club
                    }
                end
            end
        end
    end
end