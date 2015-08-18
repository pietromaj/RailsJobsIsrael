class Review < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  validates_uniqueness_of :company_id, scope:  :user_id
  validates_presence_of :content, :message => "Cannot be blank"
end
