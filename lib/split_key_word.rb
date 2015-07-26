module SplitKeyWord

  def run(column_name)
    @model_name = self.class
    @column_name = column_name
    begin
      check_model_column
      split_key_words
    rescue => e
      puts e
    end
  end


  def check_model_column
    make_constantize
    raise "There is no column #{@column_name} in model #{@model_name}" unless @model_name.columns.map(&:name).include?(@column_name)
  end

  def make_constantize
    @model_name = @model_name.to_s.camelcase.constantize
  end

  def split_key_words
    puts "<<<<<<<<<<<<<<<<<<<,Split keywords >>>>>>>>>>>>>>>>>>>>>>>>>>"
    @model_name.find_each do |obj|
      words = obj.send(@column_name).squish.split(/\ |\,|\.|\;|(\n)|\|/) if obj.send(@column_name)
      # Still the below function is not independent/dynamic as it is expecting object
      KeyWord.new.create_unique_words(words, obj) unless words.blank?
    end
  end

end


