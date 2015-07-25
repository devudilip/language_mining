class KeyWord < ActiveRecord::Base
  serialize :poem_ids
  serialize :author_ids

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

end
