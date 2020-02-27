class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :user_name
      t.integer :user_id
      t.string :img
      t.integer :best_comment_id

      t.timestamps
    end
  end
end
