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
            deck_id: find_deck_id(card["deck_name"])
        )
    end
end

def seed_deck(filename)
    data_hash = JSON.parse(File.read(path_file(filename)))
    data_hash.each do |card|
        Deck.create!(
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


seed_cards('deathnote-data.json')