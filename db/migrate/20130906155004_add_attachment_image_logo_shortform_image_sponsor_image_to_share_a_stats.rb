class AddAttachmentImageLogoShortformImageSponsorImageToShareAStats < ActiveRecord::Migration
  def self.up
    change_table :share_a_stats do |t|
      t.attachment :image
      t.attachment :logo
      t.attachment :shortform_image
      t.attachment :sponsor_image
    end
  end

  def self.down
    drop_attached_file :share_a_stats, :image
    drop_attached_file :share_a_stats, :logo
    drop_attached_file :share_a_stats, :shortform_image
    drop_attached_file :share_a_stats, :sponsor_image
  end
end
