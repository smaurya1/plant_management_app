class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.references  :user, foreign_key: true
      t.string      :request, null: false
      t.timestamps
    end
  end
end
