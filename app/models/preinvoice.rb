class Preinvoice < ApplicationRecord
    def self.addGameToCart(username,idgame)
        @preinvoices = Preinvoice.new(:username => username, :idgame => idgame)
        @preinvoices.save
    end
    def self.getPreinvoice(username)
        @preinvoices = Preinvoice.select(:namegame,:idgame,:coin).joins("inner join games on preinvoices.idgame = games.id").where("username = ?",username)
    end
    def self.removeItem(username,idgame)
       Preinvoice.where("username = ? and idgame = ?",username,idgame).delete_all
    end
   
end
