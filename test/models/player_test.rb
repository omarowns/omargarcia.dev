# == Schema Information
#
# Table name: players
#
#  id               :bigint           not null, primary key
#  playing          :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  spotify_track_id :bigint
#  user_id          :bigint           not null
#
# Indexes
#
#  index_players_on_spotify_track_id  (spotify_track_id)
#  index_players_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (spotify_track_id => spotify_tracks.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
