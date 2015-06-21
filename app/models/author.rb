class Author < ActiveRecord::Base
  default_scope { order('name') }
  has_many :poems, dependent: :destroy
end
