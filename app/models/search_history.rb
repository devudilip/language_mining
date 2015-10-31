class SearchHistory < ActiveRecord::Base

  def self.update_search_word(word,search_type='like_search')
    history = self.find_by(name: word)
    if history
      history.update_search_count(search_type)
    else
      self.create(name: word, like_search_count: 1, exact_search_count: 1)
    end
  end

  def update_search_count(search_type)
    if search_type == 'like_search'
      self.update_attribute('like_search_count', self.like_search_count + 1)
    else
      self.update_attribute('exact_search_count', self.exact_search_count + 1)
    end
  end

end