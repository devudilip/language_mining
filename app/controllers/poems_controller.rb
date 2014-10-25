class PoemsController < ApplicationController

  def index
   @poems = Poem.all
  end

end
