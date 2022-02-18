class AddCreatedDateToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :created_date, :date
  end
end
