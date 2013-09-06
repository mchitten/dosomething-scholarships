class CreateShareAStatPosts < ActiveRecord::Migration
  def change
    create_table :share_a_stat_posts do |t|
      t.string :my_name
      t.string :my_number
      t.string :friend_1
      t.string :friend_2
      t.string :friend_3
      t.string :friend_4
      t.string :friend_5
      t.string :friend_6

      t.timestamps
    end
  end
end
