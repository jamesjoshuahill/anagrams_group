#!/usr/bin/env ruby

def anagrams_group(words)
  # Remove hash of sorted characters
  # words_and_sorted_chars = {}
  # words.each do |word|
  #   words_and_sorted_chars[word] = word.chars.sort
  # end
  anagrams_group = []
  words.uniq!
  until words.empty? do
    word_to_match = words.pop
    matching_words = [word_to_match]
    words.each do |word|
      # Sort the characters as part of the comparison
      if word.chars.sort == word_to_match.chars.sort
        matching_words << word
        words.delete(word)
      end
    end
    anagrams_group << matching_words
  end
  anagrams_group
end

# list_of_words = %w{stars, mary, army, rats, tars, banana}
puts anagrams_group(ARGV).to_s