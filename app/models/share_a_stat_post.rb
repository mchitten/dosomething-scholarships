class ShareAStatPost < ActiveRecord::Base
  belongs_to :share_a_stat

  after_create do
    Services::MobileCommons.subscribe(self.my_number, self.share_a_stat.mc_alpha)

    (1..6).each do |n|
      Services::MobileCommons.subscribe(self.send("friend_#{n}"), self.share_a_stat.mc_beta)
    end
  end
end
