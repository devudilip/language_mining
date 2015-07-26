class KeyWordsController < ApplicationController

  def index
    params[:start_letter] = params[:start_letter] ? params[:start_letter] : "ಅ"
    @keywords = KeyWord.start_letter(params[:start_letter]).order("count DESC").paginate(:page => params[:page], :per_page => 50)
    @key_word_concordances = KeyWord.concordance_list
    respond_to do |format|
      format.html
      format.js
    end
  end


end
