class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references  :requests, foreign_key: true
      t.string      :response, null: false
      t.timestamps
    end
  end
end
