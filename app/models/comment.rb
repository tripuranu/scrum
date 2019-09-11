class Comment < ApplicationRecord
  belongs_to :dailyform
  belongs_to :user
end
