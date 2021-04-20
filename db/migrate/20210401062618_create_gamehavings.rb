class CreateGamehavings < ActiveRecord::Migration[6.1]
  def change
    create_table :gamehavings do |t|
      t.string :name
      t.integer :idgame
      t.text :type
      t.timestamps
    end
  end
end
