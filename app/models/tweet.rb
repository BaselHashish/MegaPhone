class Tweet < ActiveRecord::Base

belongs_to :user
serialize :likers
#validates_presence_of :tweet
#validates_length_of :tweet, minimum: 1, maximum: 150
validates_presence_of :lat
validates_presence_of :lon
validates_presence_of :user_id
validates :tweet, presence: true, length: {minimum:1,maximum:150}

scope :sorted, lambda { order("tweets.created_at DESC")}
scope :best, lambda { order("tweets.amp DESC")  }
end
