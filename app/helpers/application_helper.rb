module ApplicationHelper

  def clean_poem(text)
    # replace pipes with matched string and new line
    #'\' line is to escape '|' character. First replacing double pipe(||) then single pipe(|)
    simple_format text.gsub(/\|\||\|/) { |sym| "#{sym} <br />" }
  end

  def kannada_letters
    require 'alphabet'
    Alphabet::KannadaAlphabet.new.all_alphabets
  end

end
