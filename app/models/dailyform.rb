class Dailyform < ApplicationRecord
    belongs_to :user
    validates_uniqueness_of :date, scope: :user_id
end