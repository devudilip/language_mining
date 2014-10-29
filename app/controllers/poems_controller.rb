class PoemsController < ApplicationController

  def index
    @author = Author.find_by_id(params[:author])
    @poems = if @author
               @author.poems.paginate(:page => params[:page], :per_page => 35)
             else
               Poem.paginate(:page => params[:page], :per_page => 35)
             end
  end

end
