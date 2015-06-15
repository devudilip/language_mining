module Alphabet
  #Class to give all kannada aksharamaale
  class KannadaAlphabet
    #Method to collect all types of alpahbets,
    # other instance methods separated according to Kannada rule
    def all_alphabets
      vowels + velars + palatals + retroflex + dentals + labials + unstructured_consonants
    end

    def vowels
      %w(ಅ ಆ ಇ ಈ ಉ  ಊ ಋ ೠ ಎ ಏ ಐ ಒ ಓ ಔ ಅಂ ಅಃ)
    end

    def velars
      %w(ಕ ಖ ಗ ಘ ಙ)
    end

    def palatals
      %w(ಚ ಛ ಜ ಝ ಞ)
    end

    def retroflex
      %w(ಟ ಠ ಡ ಢ ಣ)
    end

    def dentals
      %w(ತ ಥ ದ ಧ ನ)
    end

    def labials
      %w(ಪ ಫ ಬ ಭ ಮ)
    end

    def unstructured_consonants
      %w(ಯ ರ ಱ ಲ ವ ಶ ಷ ಸ ಹ ಳ)
    end

  end

end