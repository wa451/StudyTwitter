class AddRecordDateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :record_date, :date
  end
end
