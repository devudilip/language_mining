module Concordance
  require 'alphabet'
  @@alphabets = Alphabet::KannadaAlphabet.new.all_alphabets

  #Method accepts model name and column, that concordance to be happen
  def run(model_name, column_name)
    @model_name = model_name
    @column_name = column_name
    begin
      check_model_column
      create_parent_id
      start_letter
    rescue => e
      puts e
    end
  end

  #Each concordance will have parent id, i.e Model id
  #Ex: If concordance for Poem model, then parent will be poem and childrens will be concordance of letters with this model
  def create_parent_id
    @parent_model = Concord.create(name: @model_name, concord_code: @model_name)
  end

  #Check whether model and column present, throw an exception if not
  def check_model_column
    @model_name.camelcase.constantize
    raise "There is no column #{@column_name} in model #{@model_name}" unless @model_name.camelcase.constantize.columns.map(&:name).include?(@column_name)
  end

  #Loops all the alphabets and searches for starting letter of alphabets
  def start_letter
    @@alphabets.each do |alphabet|
      results = search_letter(alphabet)
      count = results.count
      # author_ids = results.pluck(:author_id)
      # below line for keywords, must change logic
      author_ids = results.pluck(:id)
      Concord.create(name: alphabet, parent_id: @parent_model.id, concord_code: "#{@model_name}_#{alphabet}", count: count, ids: author_ids)
    end
  end

  # Searches for  starting letter which is passed as parameter
  def search_letter(letter)
    # @model_name.camelcase.constantize.where("#{@column_name} like ? ", "#{letter}%")
    # temp solution remove below line. When column strts with space we are facing this problems
    @model_name.camelcase.constantize.where("#{@column_name} like ? or #{@column_name} like ?", "#{letter}%"," #{letter}%")

  end

end