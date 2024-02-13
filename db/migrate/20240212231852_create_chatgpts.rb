class CreateChatgpts < ActiveRecord::Migration[7.1]
  def change
    create_table :chatgpts do |t|

      t.timestamps
    end
  end
end
