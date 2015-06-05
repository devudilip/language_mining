module ApplicationHelper

  def clean_poem(text)
    # replace pipes with new line
    #'\' line is to escape '|' character. First replacing double pipe(||) then single pipe(|)
    simple_format text.gsub(/\|\||\|/, '<br >')
  end

end
