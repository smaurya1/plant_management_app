class CreateHealthChecks < ActiveRecord::Migration[7.1]
  def change
    create_table :health_checks do |t|
      t.references :plant, foreign_key: true
      t.string :leafColor
      t.string :pests
      t.string :root
      t.string :spots
    end
  end
end
