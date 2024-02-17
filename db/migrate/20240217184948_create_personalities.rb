class CreatePersonalities < ActiveRecord::Migration[7.1]
  def change
    create_table :personalities do |t|
      t.string      :personality_type, null: false
    end
  end
end
