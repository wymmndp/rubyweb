class Game < ApplicationRecord
   

    def self.getGamesInCategory(idcategory)
        @games = Game.where(iddm: idcategory)
    end

    def self.searchGame(namegame,mincoin,maxcoin)   
        if (mincoin == "0") && (maxcoin == "0") 
            @games = Game.select(:id,:namegame,:tendanhmuc,:detailgame,:time,:imggame,:coin).joins("inner join danhmucs on danhmucs.id = games.iddm").where("games.namegame like ?","%#{namegame}%")
        else 
            @games = Game.select(:id,:namegame,:tendanhmuc,:detailgame,:time,:imggame,:coin).joins("inner join danhmucs on danhmucs.id = games.iddm").where("games.namegame like ? and coin between ? and ?","%#{namegame}%","#{mincoin}","#{maxcoin}")
        end
    end
end
