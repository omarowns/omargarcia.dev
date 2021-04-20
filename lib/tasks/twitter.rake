namespace :twitter do
  desc "Runs LastTweetedJob to fetch the last tweet on my Twitter account"
  task fetch_last_tweet: :environment do
    puts "Retrieving latest tweet..."
    LastTweetedJob.perform_now
    puts "done."
  end
end
