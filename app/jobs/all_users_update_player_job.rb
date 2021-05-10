# Run every X minutes (10 for Heroku Scheduler)
class AllUsersUpdatePlayerJob < ApplicationJob
  queue_as :critical

  def perform(*args)
    ::User.find_each do |user|
      PlayerUpdateService.new(user).call
    end
  end
end
