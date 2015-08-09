class Review < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  validates_uniqueness_of :company_id, scope:  :user_id, :message => "You have already reviewed this company!"
end
