class ShareAStat < ActiveRecord::Base
  attr_accessor :your_name, :your_number, :friends_numbers
  has_many :share_a_stat_posts

  has_attached_file :image, :styles => { :list => '250x141!' }, :default_url => '/images/:style/default.png'
  has_attached_file :logo
  has_attached_file :shortform_image
  has_attached_file :sponsor_image

  def to_param
    [self.id, self.title].join('-').parameterize
  end

  # after_create do
  #   expire_page controller: :share_a_stats, action: :index
  # end

  # after_save do
  #   expire_page(controller: :share_a_stats, action: :show)
  # end
end
