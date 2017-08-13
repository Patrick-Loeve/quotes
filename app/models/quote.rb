class Quote < ActiveRecord::Base
  validates :quote, :source, presence: true
end
