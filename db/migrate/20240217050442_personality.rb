class Personality < ActiveRecord::Migration[7.1]
  def change
    create_table :personalitys do |t|
      t.references  :plant, foreign_key: true
      t.string      :type, null: false
      t.timestamps
    end
  end
end
