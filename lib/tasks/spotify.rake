namespace :spotify do
  desc "Runs LastPlayedJob to fetch the last played track on Spotify"
  task fetch_last_played: :environment do
    puts "Retrieving last played track..."
    LastPlayedJob.perform_now
    puts "done."
  end
end
