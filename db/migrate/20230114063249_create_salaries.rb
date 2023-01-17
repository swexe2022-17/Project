class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.integer :maney
      t.date :date
      t.integer :week
      t.time :time1
      t.time :time2
      t.integer :company_id

      t.timestamps
    end
  end
end
