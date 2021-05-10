class AllUsersUpdatePlayerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ::User.find_each do |user|
      PlayerUpdateService.new(user).call
    end
  end
end
