class PoemsController < ApplicationController

  def index
    params[:start_letter] = params[:start_letter] ? params[:start_letter] : "ಅ"
    @poems = Poem.includes(:author).start_letter(params[:start_letter]).paginate(:page => params[:page], :per_page => 15)
    @poem_concordances = Poem.concordance_list
    respond_to do |format|
      format.html
      format.js
    end
  end


  def search
    poem = params[:poem]
    author = params[:author]
    @poems, @poems_count, @authors_count, @total_count = KeyWord.search_poem_word(poem, author)
    @poems = @poems.paginate(:page => params[:page], :per_page => 15)
  end

end
