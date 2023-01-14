class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.date :date
      t.time :time1
      t.time :time2
      t.integer :company_id
      t.integer :salary

      t.timestamps
    end
  end
end
