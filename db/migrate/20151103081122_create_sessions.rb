class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
