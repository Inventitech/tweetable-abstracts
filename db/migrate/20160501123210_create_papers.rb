class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :paperid
      t.string :secr
      t.string :email
      t.text :abstract
      t.text :controverse1
      t.text :controverse2
      t.text :controverse3

      t.timestamps null: false
    end
  end
end
