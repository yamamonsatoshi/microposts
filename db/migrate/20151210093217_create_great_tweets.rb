class CreateGreatTweets < ActiveRecord::Migration
  def change
    create_table :great_tweets do |t|
      t.string :name
      t.text :detail

      t.timestamps null: false
    end
  end
end
