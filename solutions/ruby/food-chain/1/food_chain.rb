module FoodChain
  def self.song_block(animal, action=nil, description=nil, last:false)
    {
      :animal => animal,
      :action => action,
      :description => description,
      :last => last
    }
  end

  SONG_BLOCKS = [
    song_block('fly'),
    song_block('spider', 'It wriggled and jiggled and tickled inside her.', 'wriggled and jiggled and tickled inside her'),
    song_block('bird', 'How absurd to swallow a bird!'),
    song_block('cat', 'Imagine that, to swallow a cat!'),
    song_block('dog', 'What a hog, to swallow a dog!'),
    song_block('goat', 'Just opened her throat and swallowed a goat!'),
    song_block('cow', 'I don\'t know how she swallowed a cow!'),
    song_block('horse', last:true)
  ]

  def self.song
    song_txt = ''
    SONG_BLOCKS.each.with_index {|song_block, index|
      song_txt << "I know an old lady who swallowed a #{song_block[:animal]}.\n"
      song_txt << "She's dead, of course!\n" if song_block[:last] == true
      next if song_block[:last]
      song_txt << "#{song_block[:action]}\n" if song_block[:action]
      (0...index).to_a.reverse.each {|j|
        song_block = SONG_BLOCKS[j]
        previous_song_block = SONG_BLOCKS[j+1]
        next if song_block.nil? or previous_song_block.nil?
        song_txt << "She swallowed the #{previous_song_block[:animal]} to catch the #{song_block[:animal]}"
        song_txt << " that #{song_block[:description]}" unless song_block[:description].nil?
        song_txt << ".\n"
      }
      song_txt << "I don't know why she swallowed the #{SONG_BLOCKS[0][:animal]}. Perhaps she'll die.\n"
      song_txt << "\n" if index != SONG_BLOCKS.length - 1
    }
    song_txt
  end
end