def is_annkissam(input_space_separated_string)
    nouns = ["abcd", "c", "def", "h", "ij", "cde"]
    verbs = ["bc", "fg", "g", "hij", "bcd"]
    articles = ["a", "ac", "e"]
  
    array_of_words = input_space_separated_string.split(" ")
  
    number_of_nouns = 0
    number_of_verbs = 0
    number_of_articles = 0
  
    correct_sentence = false
  
    array_of_words.each do |current_string|
      number_of_nouns += 1 if nouns.include?(current_string)
      number_of_verbs += 1 if verbs.include?(current_string)
      number_of_articles += 1 if articles.include?(current_string)
    end
  
    correct_sentence = true if number_of_verbs >= 1 && (number_of_nouns >= 1 || number_of_articles >= 2) && ((number_of_nouns + number_of_verbs + number_of_articles) == array_of_words.count)
  
    correct_sentence
  end
  
  
  def generate_all_possibilities(input_string)
    all = []
  
    (1...input_string.length).each do |i|
      
      current_string = input_string[0...i] + " " + input_string[i..-1]
      all << current_string
  
      
      sub_string_with_single_space = input_string[i..-1]
      (1...sub_string_with_single_space.length).each do |j|
        current_string = input_string[0...i] + " " + sub_string_with_single_space[0...j] + " " + sub_string_with_single_space[j..-1]
        all << current_string
  
        sub_string_with_two_spaces = sub_string_with_single_space[j..-1]
        (1...sub_string_with_two_spaces.length).each do |k|
          current_string = input_string[0...i] + " " + sub_string_with_single_space[0...j] + " " + sub_string_with_two_spaces[0...k] + " " + sub_string_with_two_spaces[k..-1]
          all << current_string
        end
      end
    end
  
    all
  end
  
  
  def get_all_elements_that_are_correct_annkissam(input_array)
    input_array.select { |current_element| is_annkissam(current_element) }
  end
  
  input_string = "abcdefg"
  
  
  all_possibilities = generate_all_possibilities(input_string)
  
  
  output = get_all_elements_that_are_correct_annkissam(all_possibilities)
  
  puts output