module ApplicationHelper

  def clean_poem(text)
    simple_format text.gsub(/\||\|\|/, '<br >')
  end

end
