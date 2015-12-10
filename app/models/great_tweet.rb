# == Schema Information
#
# Table name: great_tweets
#
#  id         :integer          not null, primary key
#  name       :string
#  detail     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GreatTweet < ActiveRecord::Base
end
