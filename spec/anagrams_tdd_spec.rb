require './anagrams_tdd'

describe AnagramsGroup do
  let(:anagram_group) { AnagramsGroup.new(%w{some words}) }

  it 'should accept an array of 2 or more words as the argument' do
    expect(anagram_group.words).to eq %w{some words}
    expect(AnagramsGroup.new(%w{some other words}).words).to eq %w{other some words}
    expect(anagram_group.words).to be_an Array
  end

  it 'should only allow an array of 2 or more words' do
    error_message = "Argument must be an array of 2 or more words"
    expect {
      AnagramsGroup.new({"some" => "words"})
    }.to raise_error(ArgumentError, error_message)
    expect {
      AnagramsGroup.new(5)
    }.to raise_error(ArgumentError, error_message)
    expect {
      AnagramsGroup.new(%w{hello})
    }.to raise_error(ArgumentError, error_message)
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

  it 'should know all the anagrams of a word in the list' do
    anagram_group = AnagramsGroup.new(%w{rats tars stars})
    expect(anagram_group.all_anagrams_of("rats")).to eq %w{rats tars}
    anagram_group = AnagramsGroup.new(%w{mary army stars})
    expect(anagram_group.all_anagrams_of("mary")).to eq %w{army mary}
  end

  it 'should provide a list of all anagram groups' do
    anagram_group = AnagramsGroup.new(%w{rats tars mary army stars banana})
    expect(anagram_group.anagram_groups).to eq [%w{army mary}, %w{banana}, %w{rats tars}, %w{stars}]

    anagram_group = AnagramsGroup.new(%w{lake pool kale loop valid})
    expect(anagram_group.anagram_groups).to eq [%w{kale lake}, %w{loop pool}, %w{valid}]
  end
  
end