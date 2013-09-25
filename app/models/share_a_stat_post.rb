class ShareAStatPost < ActiveRecord::Base
  belongs_to :share_a_stat

  validates :my_name, presence: true, format: { with: /[A-Za-z\-\'\s]+/ }
  validates :my_number, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }
  validates :friend_1, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }
  validates :friend_2, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }
  validates :friend_3, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }
  validates :friend_4, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }
  validates :friend_5, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }
  validates :friend_6, presence: true, format: { with: /\A[0-9\-\s+\(\)\+\.]+\z/ }

  after_create do
    Services::MobileCommons.subscribe(self.my_number, self.share_a_stat.mc_alpha)

    (1..6).each do |n|
      Services::MobileCommons.subscribe(self.send("friend_#{n}"), self.share_a_stat.mc_beta)
    end
  end
end
