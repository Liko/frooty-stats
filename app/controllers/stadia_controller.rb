class StadiaController < ApplicationController

    def index
        @stadia = Stadium.all
        @clubs = Club.all 
    end

end