class AddShareAStatIdToShareAStatPosts < ActiveRecord::Migration
  def change
    add_column :share_a_stat_posts, :share_a_stat_id, :integer
  end
end
