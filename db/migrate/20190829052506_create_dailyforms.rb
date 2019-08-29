class CreateDailyforms < ActiveRecord::Migration[5.2]
  def change
    create_table :dailyforms do |t|
      t.date :date
      t.text :yesterday
      t.text :today
      t.text :blockage

      t.timestamps
    end
  end
end
