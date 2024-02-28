class CreatePlantInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :plant_infos do |t|
      t.references  :plant, foreign_key: true
      t.string      :scientificName, null: false
      t.string      :wateringTimeDays, null: false
      t.string      :personality, null: false
      t.string      :sun, null: false
      t.string      :soil, null: false
      t.string      :pests, null: false
      t.string      :careLevel, null: false
      t.string      :propogation, default: "default value"
      t.string      :leaf, null: false
      t.string      :fruit, null: false
      t.string      :growthRate, null: false
      t.string      :origin, null: false
    end
  end
end
