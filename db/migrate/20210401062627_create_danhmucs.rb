class CreateDanhmucs < ActiveRecord::Migration[6.1]
  def change
    create_table :danhmucs do |t|
      t.text :tendanhmuc
      t.text :imgdanhmuc
      t.timestamps
    end
  end
end
