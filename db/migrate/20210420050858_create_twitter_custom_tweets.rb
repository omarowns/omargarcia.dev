class CreateTwitterCustomTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :twitter_custom_tweets do |t|
      t.string :status_id
      t.string :text
      t.datetime :tweeted_at

      t.timestamps
    end
  end
end
