class Dailyform < ApplicationRecord
    belongs_to :user
    validates_uniqueness_of :date, scope: :user_id
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
end