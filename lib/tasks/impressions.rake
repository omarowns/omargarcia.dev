namespace :impressions do
  desc "TODO"
  task create_visits: :environment do
    Impression.find_each do |impression|
      puts "Creating visit for #{impression.ip_address}"
      impression.create_visit(ip: impression.ip_address)
    end
  end

end
