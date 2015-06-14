class Poem < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  scope :start_letter, lambda { |letter| where("poem_text like ? ", "#{letter}%") }
end
