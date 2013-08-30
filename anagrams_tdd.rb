class AnagramsGroup
  attr_reader :words

  def initialize(words)
    error_message = "Argument must be an array of 2 or more words"
    raise ArgumentError.new(error_message) if words.class != Array
    raise ArgumentError.new(error_message) if words.count < 2
    @words = words.sort
  end

  # def words
  #   @words
  # end

  def are_anagrams?(word1, word2)
    word1.chars.sort == word2.chars.sort
  end

  def all_anagrams_of(word_to_match)
    @words.select { |word| are_anagrams?(word, word_to_match) }
  end

  def anagram_groups
    @words.map { |word| all_anagrams_of(word) }.uniq
  end
end

#simple execution test
puts AnagramsGroup.new(
  %w{rats tars stars banana mary army}
).anagram_groups.to_s