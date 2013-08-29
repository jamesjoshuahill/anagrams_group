#!/usr/bin/env ruby
array = ["stars", "stars", "tars", "mary", "army", "rats", "bananas"]

def anagrams_of(word, list)
  matching_words = []
  list.each do |list_word|
    if list_word.chars.sort == word.chars.sort #is an anagram of word
      matching_words << list_word
    end
  end
  matching_words
end

anagrams = []
array.uniq!.each do |word|
  anagrams << anagrams_of(word, array)
end

anagrams.uniq! { |list| list.first }

puts anagrams.to_s