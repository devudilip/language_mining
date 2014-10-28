class PoemsController < ApplicationController

  def index
    @poems = Poem.paginate(:page => params[:page], :per_page => 14)
  end

end
