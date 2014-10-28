class PoemsController < ApplicationController

  def index
    @author = Author.find_by_id(params[:author])
    p ".>>>>>>>>>>>>>>>>>>>>>>>>"
    p @author
    @poems = if @author
               @author.poems.paginate(:page => params[:page], :per_page => 14)
             else
               Poem.paginate(:page => params[:page], :per_page => 14)
             end
  end

end
