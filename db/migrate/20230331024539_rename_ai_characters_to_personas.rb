class RenameAiCharactersToPersonas < ActiveRecord::Migration[7.0]
  def change
    rename_table :ai_characters, :personas
  end
end
