class CreateHealthChecks < ActiveRecord::Migration[7.1]
  def change
    create_table :health_checks do |t|
      t.references :plant, foreign_key: true
      t.string   :leafColor
      t.string   :pests
      t.string   :root
      t.string   :spots
      t.string   :other
      t.date     :currentDay
      t.string   :doctor
    end
    add_column :health_checks, :image, :string
  end
end
