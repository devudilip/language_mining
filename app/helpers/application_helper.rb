module ApplicationHelper

  def kannada_letters
    require 'alphabet'
    Alphabet::KannadaAlphabet.new.all_alphabets
  end
end
