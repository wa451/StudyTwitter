class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :subject
      t.integer :time

      t.timestamps
    end
  end
end
