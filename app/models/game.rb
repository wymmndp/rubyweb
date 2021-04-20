class Game < ApplicationRecord

    def self.getGamesInCategory(idcategory)
        @games = Game.where(iddm: idcategory)
    end

    def self.searchGame(namegame,mincoin,maxcoin)
      
            @games = Game.where("namegame like ?","%#{namegame}%")
    end

end
