class AddColumnToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :translation_word_list, :string, array: true, default: []
    add_column :cards, :translation_word_base_list, :string, array: true, default: []
    add_column :cards, :translation, :string
    add_column :cards, :image, :string
    add_column :cards, :sound, :string
  end
end
