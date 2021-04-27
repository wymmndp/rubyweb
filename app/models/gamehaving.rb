class Gamehaving < ApplicationRecord
    def self.addGame(username,idgame)
        @game = Gamehaving.new(:name => username, :idgame => idgame)
        @game.save
    end
end
