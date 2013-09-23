class ShareAStat < ActiveRecord::Base
  has_many :share_a_stat_posts

  has_attached_file :image, :styles => { :list => '250x141!' }, :default_url => '/images/:style/default.png'

  def to_param
    [self.id, self.title].join('-').parameterize
  end

  before_save do
    File.open(Rails.root.to_s + '/public/system/share_a_stats/rules/' + self.rules.original_filename, 'wb') { |f| f.write(self.rules.read); f.close }
    self.rules = '/system/share_a_stats/rules/' + self.rules.original_filename
  end

  # after_create do
  #   expire_page controller: :share_a_stats, action: :index
  # end

  # after_save do
  #   expire_page(controller: :share_a_stats, action: :show)
  # end
end
