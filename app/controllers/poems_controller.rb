class PoemsController < ApplicationController

  def index
    @author = Author.find_by_id(params[:author])
    @poems = Poem.paginate(:page => params[:page], :per_page => 14)
  end

end
