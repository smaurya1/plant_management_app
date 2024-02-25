class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.references  :user, foreign_key: true
      t.references  :personality, foreign_key: true
      t.string      :name, null: false
      t.string      :species, null: false
      t.time        :wateringTime, null: false
    end
  end
end
