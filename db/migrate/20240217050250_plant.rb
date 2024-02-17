class Plant < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.references  :user, foreign_key: true
      t.string      :name, null: false
      t.string      :species, null: false
      t.string      :personality, null: false
    end
  end
end
