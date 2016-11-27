class AuthorsController < ApplicationController
  def index
    params[:start_letter] = params[:start_letter] ? params[:start_letter] : "ಅ"
    @authors = Author.start_letter(params[:start_letter]).paginate(:page => params[:page], :per_page => 15)
    @author_concordances = Author.concordance_list
    respond_to do |format|
      format.html
      format.js
    end
  end
end
