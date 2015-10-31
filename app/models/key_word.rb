class KeyWord < ActiveRecord::Base
  serialize :poem_ids
  serialize :author_ids
  default_scope { order('word') }
  scope :start_letter, lambda {|letter| where("word like ? ", "#{letter}%" )}


  def create_unique_words(array_words, row_obj)
    puts "<<<<<<<<<<<<<<<<<<<,Create unique words for #{row_obj.inspect}>>>>>>>>>>>>>>>>>>>>>>>>>>"
    words = array_words
    obj = row_obj
    words.each do |word|
      keyword = KeyWord.find_by_word(word)
      # method is not dynamic as it expecting poem and relational column like poem.author
      if keyword
        update_word_count(words, word, obj, keyword)  unless keyword.poem_ids.keys.include?(obj.id)
      else
        create_new_word(words, word, obj)
      end
    end
  end


  def create_new_word(words, word, obj)
    puts "<<<<<<<<<<<<<<<<<<<,new word for #{word} >>>>>>>>>>>>>>>>>>>>>>>>>>"
    count = word_count_in_array(words, word)
    count_in_obj = {obj.id => count}
    author_in_obj = [obj.author_id]
    KeyWord.create(word: word , poem_ids: count_in_obj, count: count, author_ids: author_in_obj)
  end

  def update_word_count(words, word, obj,keyword)
    puts "<<<<<<<<<<<<<<<<<<<,update word for #{word} >>>>>>>>>>>>>>>>>>>>>>>>>>"
    count = word_count_in_array(words, word)
    total_count = keyword.count + count
    count_in_obj = keyword.poem_ids
    count_in_obj[obj.id] = count
    author_in_obj = keyword.author_ids
    author_in_obj << obj.author_id
    keyword.update_attributes(count: total_count, poem_ids: count_in_obj, author_ids: author_in_obj)
  end

  def word_count_in_array(array,word)
    array.count(word)
  end


  def self.concordance_list
    concordance = Concord.find_by_concord_code('key_word')
    # Dummy query if concordance object is nil
    concordance ? concordance.list_all : Concord.where("id = 00")
  end

  def self.search_poem_word(word, author_id=nil, search_type='like_search')
    keywords = if search_type == 'exact_search'
                 KeyWord.where(word: word)
               else
                 KeyWord.where("word like ?", "%#{word}%")
               end
    SearchHistory.update_search_word(word,search_type)
    total_poem_count = total_poems_used(keywords).count
    total_author_count = total_authors_used(keywords).count
    total_word_count = total_word_occurrence(keywords)
    poems = poems_used_keywords(keywords)
    return poems,total_poem_count, total_author_count, total_word_count
  end


  def self.poems_used_keywords(keywords)
    poem_ids = total_poems_used(keywords)
    Poem.includes(:author).where("id IN (?)", poem_ids)
  end


  def self.total_word_occurrence(keywords)
    # values here are count of each poem which used the keywords
    keywords.map{|word| word.poem_ids.values}.flatten.sum
  end


  def self.total_poems_used(keywords)
    # keys here are poem ids which used the keywords
    keywords.map{|word| word.poem_ids.keys}.flatten.uniq
  end

  def self.total_authors_used(keywords)
    keywords.map{|word| word.author_ids}.flatten.uniq
  end
end
