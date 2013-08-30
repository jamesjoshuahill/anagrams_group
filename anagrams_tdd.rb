class AnagramsGroup
  attr_reader :words

  def initialize(words)
    raise ArgumentError.new() if words.empty?
    raise ArgumentError.new() if words.class != Array
    @words = words
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

end