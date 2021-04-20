class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :namegame
      t.longblob :imggame
      t.integer :coin
      t.text :linkgame
      t.integer :iddm
      t.text :detailgame
    end
  end
end
