class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :sentence
      t.string :sentence_with_furigana
      t.string :word_base_list, array: true
      t.string :word_list

      t.timestamps
    end
  end
end
