class Personality < ActiveRecord::Migration[7.1]
  def change
    create_table :personalities do |t|
      t.references  :plant, foreign_key: true
      t.string      :type, null: false
    end
  end
end
