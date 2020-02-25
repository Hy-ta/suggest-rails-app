class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.integer :sender_id
      t.integer :user_id
      t.text :content
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
