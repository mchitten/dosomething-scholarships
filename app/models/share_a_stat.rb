class ShareAStat < ActiveRecord::Base
  attr_accessor :your_name, :your_number, :friends_numbers
  has_many :share_a_stat_posts

  def to_param
    [self.id, self.title].join('-').parameterize
  end
end
