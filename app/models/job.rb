class Job < ActiveRecord::Base
  belongs_to :industry
  belongs_to :user
end
