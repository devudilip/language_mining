class DailyPoem < ActiveRecord::Base
  belongs_to :poem

  def self.today_poem
    @rand_poem = DailyPoem.last
    rand_poem unless @rand_poem and @rand_poem.created_at.to_date == Date.today
    poem = @rand_poem.poem
  end

  def self.rand_poem
    begin
      # Poem.order("RAND()").first => this takes little much time than below code
      rand = Poem.pluck(:id).sample
      while Poem.find(rand).poem_text.blank?
        rand = Poem.pluck(:id).sample
      end
      @rand_poem = DailyPoem.create poem_id: rand
    rescue => e
      p "ERRRORRRRRR While adding to daily poem"
      puts e
    end
  end

end
