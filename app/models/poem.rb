class Poem < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  default_scope { order('poem_text') }
  scope :start_letter, lambda { |letter| where("poem_text like ? ", "#{letter}%") }

  include SplitKeyWord

  def self.concordance_list
    concordance = Concord.find_by_concord_code(self.to_s.downcase)
    # Dummy query if concordance object is nil
    concordance ? concordance.list_all : Concord.where("id = 00")
  end

end
