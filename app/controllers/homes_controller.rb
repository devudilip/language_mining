class HomesController < ApplicationController

  def index
    @poem = Poem.order("RAND()").first
  end

end
