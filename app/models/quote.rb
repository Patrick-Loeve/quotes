class Quote < ActiveRecord::Base
  belongs_to :user
  validates :quote, :source, :user_id, presence: true
end
