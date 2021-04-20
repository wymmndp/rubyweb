class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users,id:false do |t|
      t.string :name,primary_key:true
      t.string :password_digest
      t.text :type
      t.longblob :avatar
      t.integer :coinhave
      t.integer :allcoin
      t.text :firstname
      t.text :lastname
      t.text :email
      t.datetime :time
      t.timestamps
    end
  end
end
