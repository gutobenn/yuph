class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :title
      t.text :message
      t.integer :comment_sender_id, :references => "user"
      t.integer :comment_receiver_id, :references => "user"

      t.timestamps
    end
    add_index :user_comments, :comment_sender_id
    add_index :user_comments, :comment_receiver_id
  end
end
