class CreatePreinvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :preinvoices do |t|
      t.string :username
      t.integer :idgame
    end
  end
end
