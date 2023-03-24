class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :message_threads do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :messages do |t|
      t.references :message_thread, null: false, foreign_key: true

      t.text :content, null: false
      t.text :assistant_reply

      t.timestamps
    end
  end
end
