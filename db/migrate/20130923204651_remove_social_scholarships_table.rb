class RemoveSocialScholarshipsTable < ActiveRecord::Migration
  def change
    drop_table :social_scholarships
  end
end
