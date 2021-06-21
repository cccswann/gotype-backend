class AddUniqueToDeckName < ActiveRecord::Migration[5.2]
  def change
    change_column :decks, :deck_name, :string, unique: true
  end
end
