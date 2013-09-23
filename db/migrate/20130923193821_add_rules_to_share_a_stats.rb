class AddRulesToShareAStats < ActiveRecord::Migration
  def change
    add_column :share_a_stats, :rules, :string
  end
end
