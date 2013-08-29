require './anagrams_tdd'

describe AnagramsGroup do
let(:anagram_group) { AnagramsGroup.new(%w{some words}) }

  it 'should accept an array of words as the argument' do
    expect(anagram_group.words).to eq ["some", "words"]
    expect(AnagramsGroup.new(%w{some other words}).words).to eq ["some", "other", "words"]
    expect(anagram_group.words.class).to eq Array
  end

  it 'should only allow an array of words' do
    expect {
      AnagramsGroup.new({"some" => "words"})
    }.to raise_error(ArgumentError)
  end

  it 'should not allow 0 words' do 
    expect { AnagramsGroup.new() }.to raise_error(ArgumentError)
    expect { AnagramsGroup.new([])}.to raise_error(ArgumentError)
  end

  it 'it should know if one word is an anagram of another' do
    expect(anagram_group.are_anagrams?("rats", "tars")).to be_true
  end

  it 'should know if one word is NOT an anagram of another' do
    expect(anagram_group.are_anagrams?("stars", "bananas")).to be_false
  end
  
  xit 'Should create an empty container' do

  end
end