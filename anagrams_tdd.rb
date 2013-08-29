class AnagramsGroup

  def initialize(words)
    raise ArgumentError.new() if words.empty?
    raise ArgumentError.new() if words.class != Array
    @words = words
  end

  def words
    @words
  end

  def are_anagrams?(word1, word2)
    word1.chars.sort == word2.chars.sort
  end

end