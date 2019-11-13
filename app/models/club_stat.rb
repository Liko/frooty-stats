class ClubStat < ApplicationRecord
    belongs_to :club

    def seasonGoalDifference_overall
        self.seasonGoals_overall - self.seasonConceded_overall
    end

    def seasonPoints_overall
        points = (self.seasonWinsNum_overall * 3) + self.seasonDrawsNum_overall
    end
        

end
