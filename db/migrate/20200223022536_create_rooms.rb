class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user1
      t.integer :user2
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
