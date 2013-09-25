class ShareAStat < ActiveRecord::Base
  has_many :share_a_stat_posts

  validates :title, presence: true
  validates :message, presence: true
  validates :tip, presence: true
  validates :mc_alpha, presence: true, numericality: true
  validates :mc_beta, presence: true, numericality: true
  validates :redirect, format: { with: URI::regexp }, unless: lambda { self.redirect.nil? || self.redirect.empty? }
  validates :redirect_message, presence: true
  validates :color_scheme, presence: true, inclusion: { in: %w(blue green red orange yellow gray black) }

  has_attached_file :image, :styles => { :list => '250x141!' }, :default_url => '/images/:style/default.png'
  validates_attachment :image, :presence => true, :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/pjpeg', 'image/x-png'] }

  def to_param
    [self.id, self.title].join('-').parameterize
  end

  before_save do
    unless self.rules.is_a? String
      File.open(Rails.root.to_s + '/public/system/share_a_stats/rules/' + self.rules.original_filename, 'wb') { |f| f.write(self.rules.read); f.close }
      self.rules = '/system/share_a_stats/rules/' + self.rules.original_filename
    end
  end

  # after_create do
  #   expire_page controller: :share_a_stats, action: :index
  # end

  # after_save do
  #   expire_page(controller: :share_a_stats, action: :show)
  # end
end
