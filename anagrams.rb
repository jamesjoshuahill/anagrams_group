def anagrams_group(words)
  words_and_sorted_chars = {}
  words.each do |word|
    words_and_sorted_chars[word] = word.chars.sort
  end
  anagrams_group = []
  until words.empty? do
    word_to_match = words.pop
    matching_words = [word_to_match]
    words.each do |word|
      if words_and_sorted_chars[word] == words_and_sorted_chars[word_to_match]
        matching_words << word
        words.delete(word)
      end
    end
    anagrams_group << [matching_words]
  end
  anagrams_group
end

list_of_words = %w{stars, mary, army, rats, tars, banana}
puts anagrams_group(list_of_words).to_s