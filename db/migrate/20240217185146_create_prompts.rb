class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.references  :personality, foreign_key: true
      t.string      :text, null: false
    end
  end
end
