class AddTokenUsageJsonFieldToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :usage, :jsonb, default: {}
  end
end
