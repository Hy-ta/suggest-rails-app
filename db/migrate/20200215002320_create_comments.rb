class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :post_id
      t.string :user_img
      t.integer :best_comment_id
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
