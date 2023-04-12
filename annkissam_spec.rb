require_relative 'annkissam'

RSpec.describe 'Annkissam' do
  describe '#is_annkissam' do
    it 'returns true for a valid Annkissam sentence' do
      sentence = 'a bc def'
      expect(is_annkissam(sentence)).to eq(true)
    end

    it 'returns false for an invalid Annkissam sentence' do
      sentence = 'a bc ac def'
      expect(is_annkissam(sentence)).to eq(false)
    end
  end

  describe '#generate_all_possibilities' do
    it 'generates all possible combinations of a string with no spaces' do
      input_string = 'abcdefg'
      expected_output = [
        'a b c d e f g',
        'a b c de f g',
        'a b cd e f g',
        'a b cdef g',
        'a bc d e f g',
        'a bc de f g',
        'a bcd e f g',
        'a bcdef g',
        'ab c d e f g',
        'ab c de f g',
        'ab cd e f g',
        'ab cdef g',
        'abc d e f g',
        'abc de f g',
        'abcd e f g',
        'abcdef g'
      ]
      expect(generate_all_possibilities(input_string)).to match_array(expected_output)
    end
  end
end