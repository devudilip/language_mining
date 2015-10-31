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
    poem = params[:poem].squish
    author = params[:author]
    search_type = params[:search_type]
    @poems, @poems_count, @authors_count, @total_count = KeyWord.search_poem_word(poem, author, search_type)
    @poems = @poems.paginate(:page => params[:page], :per_page => 15)
  end

end
