class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :message_sender_id, :references => "user"
      t.integer :message_receiver_id, :references => "user"

      t.timestamps
    end
    add_index :messages, :message_sender_id
    add_index :messages, :message_receiver_id
  end
end
