class Poem < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  default_scope { order('poem_text') }
  scope :start_letter, lambda { |letter| where("poem_text like ? ", "#{letter}%") }

  def self.concordance_list
    concordance = Concord.find_by_concord_code(self.to_s.downcase)
    concordance.list_all
  end

end
