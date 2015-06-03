class HomesController < ApplicationController

  def index
    @poem = DailyPoem.today_poem
  end

end
