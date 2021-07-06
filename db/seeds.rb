require 'json'

def path_file(filename) 
    file = filename
    return Rails.root.join('public', file)
end

def seed_cards(filename)
    data_hash = JSON.parse(File.read(path_file(filename)))

    data_hash.each do |card|
        Card.create!(
            sentence: card["sentence"],
            sentence_with_furigana: card["sentence_with_furigana"],
            word_base_list: card["word_base_list"],
            word_list: card["word_list"],
            deck_id: find_deck_id(card["deck_name"]),
            translation_word_list: card["translation_word_list"],
            translation_word_base_list: card["translation_word_base_list"],
            translation: card["translation"],
            image: card["image"],
            sound: card["sound"]
        )
    end
end

def seed_text(filename)
    data_hash = JSON.parse(File.read(path_file(filename)))
    data_hash.each do |text|
        Text.create!(
            language: text["language"],
            words: text["words"]
        )
    end
end

def seed_deck(filename)
    data_hash = JSON.parse(File.read(path_file(filename)))
    data_hash.each do |card|
        Deck.find_or_create_by!(
            deck_name: card["deck_name"]
        )
    end
end

def find_deck_id(name)
    Deck.all.each do |deck|
        if name == deck.deck_name
            return deck.id
        end
    end
end

seed_deck('deathnote-data.json')
seed_cards('deathnote-data.json')
seed_text('random.json')