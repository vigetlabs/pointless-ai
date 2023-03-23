class CreateAiCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_characters do |t|
      t.string :name, null: false
      t.text :prompt, null: false

      t.timestamps
    end
  end
end
