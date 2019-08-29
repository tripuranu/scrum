class AddUserIdToDailyforms < ActiveRecord::Migration[5.2]
  def change
    add_column :dailyforms, :user_id, :integer
  end
end
