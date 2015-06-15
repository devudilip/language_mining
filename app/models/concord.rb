class Concord < ActiveRecord::Base
  include Concordance

  def list_all
    Concord.where(parent_id: self.id).select('name', 'count')
  end
end
