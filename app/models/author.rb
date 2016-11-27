class Author < ActiveRecord::Base
  default_scope { order('name') }
  has_many :poems, dependent: :destroy
  # scope :start_letter, lambda { |letter| where("name like ? ", "#{letter}%") }
  # Temp solution when column starts with space
  scope :start_letter, lambda { |letter| where("name like ? or name like ?", "#{letter}%"," #{letter}%") }


  def self.concordance_list
    concordance = Concord.find_by_concord_code(self.to_s.downcase)
    # Dummy query if concordance object is nil
    concordance ? concordance.list_all : Concord.where("id = 00")
  end


end
